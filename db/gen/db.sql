
begin;


create schema forum_example;
create schema forum_example_private;

create table forum_example.person (
  id               serial primary key,
  first_name       text not null check (char_length(first_name) < 80),
  last_name        text check (char_length(last_name) < 80),
  about            text,
  created_at       timestamp default now()
);

comment on table forum_example.person is 'A user of the forum.';
comment on column forum_example.person.id is 'The primary unique identifier for the person.';
comment on column forum_example.person.first_name is 'The person’s first name.';
comment on column forum_example.person.last_name is 'The person’s last name.';
comment on column forum_example.person.about is 'A short description about the user, written by the user.';
comment on column forum_example.person.created_at is 'The time this person was created.';

create type forum_example.post_topic as enum (
  'discussion',
  'inspiration',
  'help',
  'showcase'
);

create table forum_example.post (
  id               serial primary key,
  author_id        integer not null references forum_example.person(id),
  headline         text not null check (char_length(headline) < 280),
  body             text,
  topic            forum_example.post_topic,
  created_at       timestamp default now()
);

comment on table forum_example.post is 'A forum post written by a user.';
comment on column forum_example.post.id is 'The primary key for the post.';
comment on column forum_example.post.headline is 'The title written by the user.';
comment on column forum_example.post.author_id is 'The id of the author user.';
comment on column forum_example.post.topic is 'The topic this has been posted in.';
comment on column forum_example.post.body is 'The main body text of our post.';
comment on column forum_example.post.created_at is 'The time this post was created.';

alter default privileges revoke execute on functions from public;

create function forum_example.person_full_name(person forum_example.person) returns text as $$
  select person.first_name || ' ' || person.last_name
$$ language sql stable;

comment on function forum_example.person_full_name(forum_example.person) is 'A person’s full name which is a concatenation of their first and last name.';

create function forum_example.post_summary(
  post forum_example.post,
  length int default 50,
  omission text default '…'
) returns text as $$
  select case
    when post.body is null then null
    else substr(post.body, 0, length) || omission
  end
$$ language sql stable;

comment on function forum_example.post_summary(forum_example.post, int, text) is 'A truncated version of the body for summaries.';

create function forum_example.person_latest_post(person forum_example.person) returns forum_example.post as $$
  select post.*
  from forum_example.post as post
  where post.author_id = person.id
  order by created_at desc
  limit 1
$$ language sql stable;

comment on function forum_example.person_latest_post(forum_example.person) is 'Gets the latest post written by the person.';

create function forum_example.search_posts(search text) returns setof forum_example.post as $$
  select post.*
  from forum_example.post as post
  where post.headline ilike ('%' || search || '%') or post.body ilike ('%' || search || '%')
$$ language sql stable;

comment on function forum_example.search_posts(text) is 'Returns posts containing a given search term.';

alter table forum_example.person add column updated_at timestamp default now();
alter table forum_example.post add column updated_at timestamp default now();

create function forum_example_private.set_updated_at() returns trigger as $$
begin
  new.updated_at := current_timestamp;
  return new;
end;
$$ language plpgsql;

create trigger person_updated_at before update
  on forum_example.person
  for each row
  execute procedure forum_example_private.set_updated_at();

create trigger post_updated_at before update
  on forum_example.post
  for each row
  execute procedure forum_example_private.set_updated_at();

create table forum_example_private.person_account (
  person_id        integer primary key references forum_example.person(id) on delete cascade,
  email            text not null unique check (email ~* '^.+@.+\..+$'),
  password_hash    text not null
);

comment on table forum_example_private.person_account is 'Private information about a person’s account.';
comment on column forum_example_private.person_account.person_id is 'The id of the person associated with this account.';
comment on column forum_example_private.person_account.email is 'The email address of the person.';
comment on column forum_example_private.person_account.password_hash is 'An opaque hash of the person’s password.';

create extension if not exists "pgcrypto";

create function forum_example.register_person(
  first_name text,
  last_name text,
  email text,
  password text
) returns forum_example.person as $$
declare
  person forum_example.person;
begin
  insert into forum_example.person (first_name, last_name) values
    (first_name, last_name)
    returning * into person;

  insert into forum_example_private.person_account (person_id, email, password_hash) values
    (person.id, email, crypt(password, gen_salt('bf')));

  return person;
end;
$$ language plpgsql strict security definer;

comment on function forum_example.register_person(text, text, text, text) is 'Registers a single user and creates an account in our forum.';

-- create role forum_example_postgraphile login password 'xyz';

-- create role forum_example_anonymous;
grant forum_example_anonymous to forum_example_postgraphile;

-- create role forum_example_person;
grant forum_example_person to forum_example_postgraphile;

create type forum_example.jwt_token as (
  role text,
  person_id integer
);

create function forum_example.authenticate(
  email text,
  password text
) returns forum_example.jwt_token as $$
  select ('forum_example_person', person_id)::forum_example.jwt_token
    from forum_example_private.person_account
    where
      person_account.email = $1
      and person_account.password_hash = crypt($2, person_account.password_hash);
$$ language sql strict security definer;

comment on function forum_example.authenticate(text, text) is 'Creates a JWT token that will securely identify a person and give them certain permissions.';

create function forum_example.current_person() returns forum_example.person as $$
  select *
  from forum_example.person
  where id = current_setting('jwt.claims.person_id', true)::integer
$$ language sql stable;

comment on function forum_example.current_person() is 'Gets the person who was identified by our JWT.';

create function forum_example.change_password(current_password text, new_password text)
returns boolean as $$
declare
  current_person forum_example.person;
begin
  current_person := forum_example.current_person();
  if exists (select 1 from forum_example_private.person_account where person_account.person_id = current_person.id and person_account.password_hash = crypt($1, person_account.password_hash))
  then
    update forum_example_private.person_account set password_hash = crypt($2, gen_salt('bf')) where person_account.person_id = current_person.id;
    return true;
  else
    return false;
  end if;
end;
$$ language plpgsql strict security definer;

grant usage on schema forum_example to forum_example_anonymous, forum_example_person;

grant select on table forum_example.person to forum_example_anonymous, forum_example_person;
grant update, delete on table forum_example.person to forum_example_person;

grant select on table forum_example.post to forum_example_anonymous, forum_example_person;
grant insert, update, delete on table forum_example.post to forum_example_person;
grant usage on sequence forum_example.post_id_seq to forum_example_person;

grant execute on function forum_example.person_full_name(forum_example.person) to forum_example_anonymous, forum_example_person;
grant execute on function forum_example.post_summary(forum_example.post, integer, text) to forum_example_anonymous, forum_example_person;
grant execute on function forum_example.person_latest_post(forum_example.person) to forum_example_anonymous, forum_example_person;
grant execute on function forum_example.search_posts(text) to forum_example_anonymous, forum_example_person;
grant execute on function forum_example.authenticate(text, text) to forum_example_anonymous, forum_example_person;
grant execute on function forum_example.current_person() to forum_example_anonymous, forum_example_person;
grant execute on function forum_example.change_password(text, text) to forum_example_person;

grant execute on function forum_example.register_person(text, text, text, text) to forum_example_anonymous;

alter table forum_example.person enable row level security;
alter table forum_example.post enable row level security;

create policy select_person on forum_example.person for select
  using (true);

create policy select_post on forum_example.post for select
  using (true);

create policy update_person on forum_example.person for update to forum_example_person
  using (id = current_setting('jwt.claims.person_id', true)::integer);

create policy delete_person on forum_example.person for delete to forum_example_person
  using (id = current_setting('jwt.claims.person_id', true)::integer);

create policy insert_post on forum_example.post for insert to forum_example_person
  with check (author_id = current_setting('jwt.claims.person_id', true)::integer);

create policy update_post on forum_example.post for update to forum_example_person
  using (author_id = current_setting('jwt.claims.person_id', true)::integer);

create policy delete_post on forum_example.post for delete to forum_example_person
  using (author_id = current_setting('jwt.claims.person_id', true)::integer);


commit; -- SAFE BEGIN FOR CONCAT
SET search_path TO public;
CREATE TABLE "Classes" (
  "id" SERIAL,
  "color" varchar,
  "name" varchar
);
CREATE UNIQUE INDEX ON "Classes" ("id");
CREATE TABLE "Players" (
  "id" SERIAL,
  "name" varchar,
  "classId" int,
  "isAdmin" boolean,
  "password" varchar
);
CREATE UNIQUE INDEX ON "Players" ("id");
ALTER TABLE "Players" ADD FOREIGN KEY ("classId") REFERENCES "Classes" ("id");
CREATE TABLE "Slots" ("id" SERIAL, "name" varchar);
CREATE UNIQUE INDEX ON "Slots" ("id");
CREATE TABLE "PlayerSlots" (
    "id" SERIAL,
    "playerId" int,
    "slotId" int,
    "enchanted" boolean,
    "scoreMerite" int,
    "validated" boolean
  );
CREATE UNIQUE INDEX ON "PlayerSlots" ("id");
CREATE TABLE "Merite" ("id" SERIAL, "name" varchar, "value" int);
CREATE UNIQUE INDEX ON "Merite" ("id");
CREATE TABLE "PlayerMerite" (
    "id" SERIAL,
    "meriteId" int,
    "playerId" int,
    "date" date,
    "active" boolean
  );
CREATE UNIQUE INDEX ON "PlayerMerite" ("id");
CREATE TABLE "Loots" (
    "id" SERIAL,
    "playerId" int,
    "itemId" int,
    "date" date
  );
CREATE UNIQUE INDEX ON "Loots" ("id");
CREATE TABLE "Items" (
    "id" SERIAL,
    "name" varchar,
    "wowheadId" int,
    "classId" int
  );
CREATE UNIQUE INDEX ON "Items" ("id");
CREATE UNIQUE INDEX ON "Items" ("wowheadId");
CREATE TABLE "ClassItem" (
    "id" SERIAL,
    "classId" int,
    "itemId" int,
    "itemValueForThisClass" int
  );
CREATE UNIQUE INDEX ON "ClassItem" ("id");
CREATE TABLE "BossItem" ("id" SERIAL, "itemId" int, "bossId" int);
CREATE UNIQUE INDEX ON "BossItem" ("id");
CREATE TABLE "Bosses" (
    "id" SERIAL,
    "donjonId" int,
    "name" varchar
  );
CREATE UNIQUE INDEX ON "Bosses" ("id");
CREATE TABLE "Donjons" (
    "id" SERIAL,
    "name" varchar,
    "shortName" varchar,
    "active" boolean
  );
CREATE UNIQUE INDEX ON "Donjons" ("id");
CREATE TABLE "Raids" ("id" SERIAL, "donjonId" int, "date" date);
CREATE UNIQUE INDEX ON "Raids" ("id");
ALTER TABLE "Raids" ADD FOREIGN KEY ("donjonId") REFERENCES "Donjons" ("id");
CREATE TABLE "RaidPlayers" (
    "id" SERIAL,
    "playerId" int,
    "raidId" int
  );
CREATE UNIQUE INDEX ON "RaidPlayers" ("id");
ALTER TABLE "RaidPlayers" ADD FOREIGN KEY ("raidId") REFERENCES "Raids" ("id");
ALTER TABLE "RaidPlayers" ADD FOREIGN KEY ("playerId") REFERENCES "Players" ("id");
ALTER TABLE "Players" ADD FOREIGN KEY ("classId") REFERENCES "Classes" ("id");
ALTER TABLE "PlayerSlots" ADD FOREIGN KEY ("playerId") REFERENCES "Players" ("id");
ALTER TABLE "PlayerSlots" ADD FOREIGN KEY ("slotId") REFERENCES "Slots" ("id");
ALTER TABLE "PlayerMerite" ADD FOREIGN KEY ("meriteId") REFERENCES "Merite" ("id");
ALTER TABLE "PlayerMerite" ADD FOREIGN KEY ("playerId") REFERENCES "Players" ("id");
ALTER TABLE "Loots" ADD FOREIGN KEY ("playerId") REFERENCES "Players" ("id");
ALTER TABLE "Loots" ADD FOREIGN KEY ("itemId") REFERENCES "Items" ("id");
ALTER TABLE "ClassItem" ADD FOREIGN KEY ("itemId") REFERENCES "Items" ("id");
ALTER TABLE "ClassItem" ADD FOREIGN KEY ("classId") REFERENCES "Classes" ("id");
ALTER TABLE "Items" ADD FOREIGN KEY ("classId") REFERENCES "Classes" ("id");
ALTER TABLE "BossItem" ADD FOREIGN KEY ("itemId") REFERENCES "Items" ("id");
ALTER TABLE "BossItem" ADD FOREIGN KEY ("bossId") REFERENCES "Bosses" ("id");
ALTER TABLE "Bosses" ADD FOREIGN KEY ("donjonId") REFERENCES "Donjons" ("id"); -- SAFE BEGIN FOR CONCAT
INSERT INTO "Classes" ("name", "color")
VALUES
('Prêtre',    '#FFFFFF'),
('Mage',      '#69CCF0'),
('Démoniste', '#9482C9'),
('Voleur',    '#FFF569'),
('Druide',    '#FF7D0A'),
('Chasseur',  '#ABD473'),
('Chaman',    '#0070DE'),
('Guerrier',  '#C79C6E'),
('Paladin',   '#F58CBA');

INSERT INTO
  "Slots" ( "name")
VALUES
  ('Main droite'),
  ('Main gauche'),
  ('Tête'),
  ('Cou'),
  ('Épaules'),
  ('Dos'),
  ('Torse'),
  ('Poignets'),
  ('Mains'),
  ('Ceinture'),
  ('Jambes'),
  ('Pieds'),
  ('Doigt'),
  ('Trinket'),
  ('Idole');


INSERT INTO "Players" ("name", "classId", "isAdmin", "password")
VALUES
('Devilhunter', 6, true, 'anything');
 -- SAFE BEGIN FOR CONCAT
INSERT INTO "Donjons" ("name", "shortName", "active")
VALUES
('Molten Core', 'MC', true),
('Onyxia Lair', 'Ony', true),
('Blackwing Lair', 'BWL', false),
('Ahn‘Qiraj Temple', 'AQ40', false),
('Naxxramas', 'Naxx', false),
('Ahn‘Qiraj Ruins', 'AQ20', false),
('Zul‘Gurub', 'ZG', false);

INSERT INTO "Bosses" ("name", "donjonId" )
VALUES
('Trashs', (SELECT id FROM "Donjons" WHERE "shortName"='MC')),
('Trashs', (SELECT id FROM "Donjons" WHERE "shortName"='Ony')),
('Trashs', (SELECT id FROM "Donjons" WHERE "shortName"='BWL')),
('Trashs', (SELECT id FROM "Donjons" WHERE "shortName"='AQ40')),
('Trashs', (SELECT id FROM "Donjons" WHERE "shortName"='Naxx')),
('Trashs', (SELECT id FROM "Donjons" WHERE "shortName"='AQ20')),
('Trashs', (SELECT id FROM "Donjons" WHERE "shortName"='7')),
('Lucifron', (SELECT id FROM "Donjons" WHERE "shortName"='MC')),
('Magmadar', (SELECT id FROM "Donjons" WHERE "shortName"='MC')),
('Gehennas', (SELECT id FROM "Donjons" WHERE "shortName"='MC')),
('Garr', (SELECT id FROM "Donjons" WHERE "shortName"='MC')),
('Shazzrah', (SELECT id FROM "Donjons" WHERE "shortName"='MC')),
('Baron Geddon', (SELECT id FROM "Donjons" WHERE "shortName"='MC')),
('Sulfuron Harbinger', (SELECT id FROM "Donjons" WHERE "shortName"='MC')),
('Golemagg the Incinerator', (SELECT id FROM "Donjons" WHERE "shortName"='MC')),
('Majordomo Executus', (SELECT id FROM "Donjons" WHERE "shortName"='MC')),
('Ragnaros', (SELECT id FROM "Donjons" WHERE "shortName"='MC')),
('Onyxia', (SELECT id FROM "Donjons" WHERE "shortName"='Ony')),
('Razorgore the Untamed', (SELECT id FROM "Donjons" WHERE "shortName"='BWL')),
('Vaelastrasz the Corrupt', (SELECT id FROM "Donjons" WHERE "shortName"='BWL')),
('Broodlord Lashlayer', (SELECT id FROM "Donjons" WHERE "shortName"='BWL')),
('Firemaw', (SELECT id FROM "Donjons" WHERE "shortName"='BWL')),
('Ebonroc', (SELECT id FROM "Donjons" WHERE "shortName"='BWL')),
('Flamegor', (SELECT id FROM "Donjons" WHERE "shortName"='BWL')),
('Chromaggus', (SELECT id FROM "Donjons" WHERE "shortName"='BWL')),
('Nefarian', (SELECT id FROM "Donjons" WHERE "shortName"='BWL')),
('The Prophet Skeram', (SELECT id FROM "Donjons" WHERE "shortName"='AQ40')),
('Battleguard Sartura', (SELECT id FROM "Donjons" WHERE "shortName"='AQ40')),
('Fankriss the Unyielding', (SELECT id FROM "Donjons" WHERE "shortName"='AQ40')),
('Princess Huhuran', (SELECT id FROM "Donjons" WHERE "shortName"='AQ40')),
('Silithid Royalty', (SELECT id FROM "Donjons" WHERE "shortName"='AQ40')),
('Viscidus', (SELECT id FROM "Donjons" WHERE "shortName"='AQ40')),
('The Twin Emperors', (SELECT id FROM "Donjons" WHERE "shortName"='AQ40')),
('Ouro', (SELECT id FROM "Donjons" WHERE "shortName"='AQ40')),
('C‘thun', (SELECT id FROM "Donjons" WHERE "shortName"='AQ40')),
('Anub‘Rekhan', (SELECT id FROM "Donjons" WHERE "shortName"='Naxx')),
('Grand Widow Faerlina', (SELECT id FROM "Donjons" WHERE "shortName"='Naxx')),
('Maexxna', (SELECT id FROM "Donjons" WHERE "shortName"='Naxx')),
('Noth the Plaguebringer', (SELECT id FROM "Donjons" WHERE "shortName"='Naxx')),
('Heigan the Unclean', (SELECT id FROM "Donjons" WHERE "shortName"='Naxx')),
('Loatheb', (SELECT id FROM "Donjons" WHERE "shortName"='Naxx')),
('Instructor Razuvious', (SELECT id FROM "Donjons" WHERE "shortName"='Naxx')),
('Gothik the Harvester', (SELECT id FROM "Donjons" WHERE "shortName"='Naxx')),
('The Four Horsemen', (SELECT id FROM "Donjons" WHERE "shortName"='Naxx')),
('Patchwerk', (SELECT id FROM "Donjons" WHERE "shortName"='Naxx')),
('Grobbulus', (SELECT id FROM "Donjons" WHERE "shortName"='Naxx')),
('Gluth', (SELECT id FROM "Donjons" WHERE "shortName"='Naxx')),
('Thaddius', (SELECT id FROM "Donjons" WHERE "shortName"='Naxx')),
('Sapphiron', (SELECT id FROM "Donjons" WHERE "shortName"='Naxx')),
('Kel‘Thuzad', (SELECT id FROM "Donjons" WHERE "shortName"='Naxx')),
('Kurinnaxx', (SELECT id FROM "Donjons" WHERE "shortName"='AQ20')),
('General Rajaxx', (SELECT id FROM "Donjons" WHERE "shortName"='AQ20')),
('Moam', (SELECT id FROM "Donjons" WHERE "shortName"='AQ20')),
('Buru the Gorger', (SELECT id FROM "Donjons" WHERE "shortName"='AQ20')),
('Ayamiss the Hunter', (SELECT id FROM "Donjons" WHERE "shortName"='AQ20')),
('Ossirian the Unscarred', (SELECT id FROM "Donjons" WHERE "shortName"='AQ20'));
-- REDO ZG -- SAFE BEGIN FOR CONCAT
-- SELECT 1 AS "Lucifron";
INSERT INTO "Items" ("name","wowheadId","classId")
VALUES
('Gantelets de puissance',16863,(SELECT id FROM "Classes" WHERE "name"='Guerrier')),
('Gants de Gangrecoeur',16805,(SELECT id FROM "Classes" WHERE "name"='Démoniste')),
('Bottes cénariennes',16829,(SELECT id FROM "Classes" WHERE "name"='Druide')),
('Collier d‘illumination',17109,(SELECT id FROM "Classes" WHERE "name"='')),
('Bottes d‘arcaniste',16800,(SELECT id FROM "Classes" WHERE "name"='Mage')),
('Bottes judiciaires',16859,(SELECT id FROM "Classes" WHERE "name"='Paladin')),
('Bottes Rageterre',16837,(SELECT id FROM "Classes" WHERE "name"='Chaman')),
('Anneau de puissance de sort',19147,(SELECT id FROM "Classes" WHERE "name"='')),
('Anneau épais en sombrefer',18879,(SELECT id FROM "Classes" WHERE "name"='')),
('Jambières de Tempête de mana',18872,(SELECT id FROM "Classes" WHERE "name"='')),
('Robe du pouvoir volatil',19145,(SELECT id FROM "Classes" WHERE "name"='')),
('Cuissards d‘Attise-flammes',18861,(SELECT id FROM "Classes" WHERE "name"=''));

INSERT INTO "BossItem" ("bossId","itemId")
VALUES
((SELECT id FROM "Bosses" WHERE "name"='Lucifron'),(SELECT id FROM "Items" WHERE "wowheadId"=16863)),
((SELECT id FROM "Bosses" WHERE "name"='Lucifron'),(SELECT id FROM "Items" WHERE "wowheadId"=16805)),
((SELECT id FROM "Bosses" WHERE "name"='Lucifron'),(SELECT id FROM "Items" WHERE "wowheadId"=16829)),
((SELECT id FROM "Bosses" WHERE "name"='Lucifron'),(SELECT id FROM "Items" WHERE "wowheadId"=17109)),
((SELECT id FROM "Bosses" WHERE "name"='Lucifron'),(SELECT id FROM "Items" WHERE "wowheadId"=16800)),
((SELECT id FROM "Bosses" WHERE "name"='Lucifron'),(SELECT id FROM "Items" WHERE "wowheadId"=16859)),
((SELECT id FROM "Bosses" WHERE "name"='Lucifron'),(SELECT id FROM "Items" WHERE "wowheadId"=16837)),
((SELECT id FROM "Bosses" WHERE "name"='Lucifron'),(SELECT id FROM "Items" WHERE "wowheadId"=19147)),
((SELECT id FROM "Bosses" WHERE "name"='Lucifron'),(SELECT id FROM "Items" WHERE "wowheadId"=18879)),
((SELECT id FROM "Bosses" WHERE "name"='Lucifron'),(SELECT id FROM "Items" WHERE "wowheadId"=18872)),
((SELECT id FROM "Bosses" WHERE "name"='Lucifron'),(SELECT id FROM "Items" WHERE "wowheadId"=19145)),
((SELECT id FROM "Bosses" WHERE "name"='Lucifron'),(SELECT id FROM "Items" WHERE "wowheadId"=18861));

-- SELECT 1 AS "Magmadar";
INSERT INTO "Items" ("name","wowheadId","classId")
VALUES
('Trembleterre',17073,(SELECT id FROM "Classes" WHERE "name"='')),
('Jambières cénariennes',16835,(SELECT id FROM "Classes" WHERE "name"='Druide')),
('Pantalon de Gangrecoeur',16810,(SELECT id FROM "Classes" WHERE "name"='Démoniste')),
('Pantalon de prophétie',16814,(SELECT id FROM "Classes" WHERE "name"='Prêtre')),
('Marque du Frappeur',17069,(SELECT id FROM "Classes" WHERE "name"='')),
('Jambières d‘arcaniste',16796,(SELECT id FROM "Classes" WHERE "name"='Mage')),
('Jambières de puissance',16867,(SELECT id FROM "Classes" WHERE "name"='Guerrier')),
('Médaillon de Puissance inébranlable',17065,(SELECT id FROM "Classes" WHERE "name"='')),
('Pantalon du tueur de la nuit',16822,(SELECT id FROM "Classes" WHERE "name"='Voleur')),
('Jambières de traqueur de géant',16847,(SELECT id FROM "Classes" WHERE "name"='Chasseur')),
('Griffe droite d‘Eskhandar',18203,(SELECT id FROM "Classes" WHERE "name"='')),
('Jambières judiciaires',16855,(SELECT id FROM "Classes" WHERE "name"='Paladin')),
('Grimoire de runes de feu',19142,(SELECT id FROM "Classes" WHERE "name"='')),
('Anneau de frappe rapide',18821,(SELECT id FROM "Classes" WHERE "name"='')),
('Corde de mana enflammé',19136,(SELECT id FROM "Classes" WHERE "name"='')),
('Gantelets de garde des flammes',19143,(SELECT id FROM "Classes" WHERE "name"='')),
('Lame à tranchant d‘obsidienne',18822,(SELECT id FROM "Classes" WHERE "name"='')),
('Talisman de pouvoir éphémère',18820,(SELECT id FROM "Classes" WHERE "name"='')),
('Vieux gants en cuir du Magma',18823,(SELECT id FROM "Classes" WHERE "name"='')),
('Bottes durcies dans le magma',18824,(SELECT id FROM "Classes" WHERE "name"='')),
('Jambières Rageterre',16843,(SELECT id FROM "Classes" WHERE "name"='Chaman')),
('Spallières de la Terre profonde',18829,(SELECT id FROM "Classes" WHERE "name"='')),
('Solerets du Marcheflammes',19144,(SELECT id FROM "Classes" WHERE "name"=''));
-- ('Cuissards d‘Attise-flammes',18861,(SELECT id FROM "Classes" WHERE "name"='')),

INSERT INTO "BossItem" ("bossId","itemId")
VALUES
((SELECT id FROM "Bosses" WHERE "name"='Magmadar'),(SELECT id FROM "Items" WHERE "wowheadId"=17073)),
((SELECT id FROM "Bosses" WHERE "name"='Magmadar'),(SELECT id FROM "Items" WHERE "wowheadId"=16835)),
((SELECT id FROM "Bosses" WHERE "name"='Magmadar'),(SELECT id FROM "Items" WHERE "wowheadId"=16810)),
((SELECT id FROM "Bosses" WHERE "name"='Magmadar'),(SELECT id FROM "Items" WHERE "wowheadId"=16814)),
((SELECT id FROM "Bosses" WHERE "name"='Magmadar'),(SELECT id FROM "Items" WHERE "wowheadId"=17069)),
((SELECT id FROM "Bosses" WHERE "name"='Magmadar'),(SELECT id FROM "Items" WHERE "wowheadId"=16796)),
((SELECT id FROM "Bosses" WHERE "name"='Magmadar'),(SELECT id FROM "Items" WHERE "wowheadId"=16867)),
((SELECT id FROM "Bosses" WHERE "name"='Magmadar'),(SELECT id FROM "Items" WHERE "wowheadId"=17065)),
((SELECT id FROM "Bosses" WHERE "name"='Magmadar'),(SELECT id FROM "Items" WHERE "wowheadId"=16822)),
((SELECT id FROM "Bosses" WHERE "name"='Magmadar'),(SELECT id FROM "Items" WHERE "wowheadId"=16847)),
((SELECT id FROM "Bosses" WHERE "name"='Magmadar'),(SELECT id FROM "Items" WHERE "wowheadId"=18203)),
((SELECT id FROM "Bosses" WHERE "name"='Magmadar'),(SELECT id FROM "Items" WHERE "wowheadId"=16855)),
((SELECT id FROM "Bosses" WHERE "name"='Magmadar'),(SELECT id FROM "Items" WHERE "wowheadId"=19142)),
((SELECT id FROM "Bosses" WHERE "name"='Magmadar'),(SELECT id FROM "Items" WHERE "wowheadId"=18821)),
((SELECT id FROM "Bosses" WHERE "name"='Magmadar'),(SELECT id FROM "Items" WHERE "wowheadId"=19136)),
((SELECT id FROM "Bosses" WHERE "name"='Magmadar'),(SELECT id FROM "Items" WHERE "wowheadId"=19143)),
((SELECT id FROM "Bosses" WHERE "name"='Magmadar'),(SELECT id FROM "Items" WHERE "wowheadId"=18822)),
((SELECT id FROM "Bosses" WHERE "name"='Magmadar'),(SELECT id FROM "Items" WHERE "wowheadId"=18820)),
((SELECT id FROM "Bosses" WHERE "name"='Magmadar'),(SELECT id FROM "Items" WHERE "wowheadId"=18823)),
((SELECT id FROM "Bosses" WHERE "name"='Magmadar'),(SELECT id FROM "Items" WHERE "wowheadId"=18824)),
((SELECT id FROM "Bosses" WHERE "name"='Magmadar'),(SELECT id FROM "Items" WHERE "wowheadId"=18861)),
((SELECT id FROM "Bosses" WHERE "name"='Magmadar'),(SELECT id FROM "Items" WHERE "wowheadId"=16843)),
((SELECT id FROM "Bosses" WHERE "name"='Magmadar'),(SELECT id FROM "Items" WHERE "wowheadId"=18829)),
((SELECT id FROM "Bosses" WHERE "name"='Magmadar'),(SELECT id FROM "Items" WHERE "wowheadId"=19144));

-- SELECT 1 AS "Gehennas";
INSERT INTO "Items" ("name","wowheadId","classId")
VALUES
('Gants de prophétie',16812,(SELECT id FROM "Classes" WHERE "name"='Prêtre')),
('Bottes de traqueur de géant',16849,(SELECT id FROM "Classes" WHERE "name"='Chasseur')),
('Gants du tueur de la nuit',16826,(SELECT id FROM "Classes" WHERE "name"='Voleur')),
('Sandales de puissance',16862,(SELECT id FROM "Classes" WHERE "name"='Guerrier')),
('Gantelets judiciaires',16860,(SELECT id FROM "Classes" WHERE "name"='Paladin')),
('Gantelets Rageterre',16839,(SELECT id FROM "Classes" WHERE "name"='Chaman')),
('Dague ensorceleuse',18878,(SELECT id FROM "Classes" WHERE "name"='')),
('Ecraseur cramoisi',17077,(SELECT id FROM "Classes" WHERE "name"='')),
('Garde-poignets de stabilité',19146,(SELECT id FROM "Classes" WHERE "name"='')),
('Pantalon en écailles de salamandre',18875,(SELECT id FROM "Classes" WHERE "name"=''));
-- ('Robe du pouvoir volatil',19145,(SELECT id FROM "Classes" WHERE "name"='')),
-- ('Cuissards d‘Attise-flammes',18861,(SELECT id FROM "Classes" WHERE "name"='')),
-- ('Jambières de Tempête de mana',18872,(SELECT id FROM "Classes" WHERE "name"='')),
-- ('Anneau épais en sombrefer',18879,(SELECT id FROM "Classes" WHERE "name"='')),
-- ('Anneau de puissance de sort',19147,(SELECT id FROM "Classes" WHERE "name"=''));

INSERT INTO "BossItem" ("bossId","itemId")
VALUES
((SELECT id FROM "Bosses" WHERE "name"='Gehennas'),(SELECT id FROM "Items" WHERE "wowheadId"=16812)),
((SELECT id FROM "Bosses" WHERE "name"='Gehennas'),(SELECT id FROM "Items" WHERE "wowheadId"=16849)),
((SELECT id FROM "Bosses" WHERE "name"='Gehennas'),(SELECT id FROM "Items" WHERE "wowheadId"=16826)),
((SELECT id FROM "Bosses" WHERE "name"='Gehennas'),(SELECT id FROM "Items" WHERE "wowheadId"=16862)),
((SELECT id FROM "Bosses" WHERE "name"='Gehennas'),(SELECT id FROM "Items" WHERE "wowheadId"=16860)),
((SELECT id FROM "Bosses" WHERE "name"='Gehennas'),(SELECT id FROM "Items" WHERE "wowheadId"=16839)),
((SELECT id FROM "Bosses" WHERE "name"='Gehennas'),(SELECT id FROM "Items" WHERE "wowheadId"=18872)),
((SELECT id FROM "Bosses" WHERE "name"='Gehennas'),(SELECT id FROM "Items" WHERE "wowheadId"=18879)),
((SELECT id FROM "Bosses" WHERE "name"='Gehennas'),(SELECT id FROM "Items" WHERE "wowheadId"=18878)),
((SELECT id FROM "Bosses" WHERE "name"='Gehennas'),(SELECT id FROM "Items" WHERE "wowheadId"=17077)),
((SELECT id FROM "Bosses" WHERE "name"='Gehennas'),(SELECT id FROM "Items" WHERE "wowheadId"=19146)),
((SELECT id FROM "Bosses" WHERE "name"='Gehennas'),(SELECT id FROM "Items" WHERE "wowheadId"=19145)),
((SELECT id FROM "Bosses" WHERE "name"='Gehennas'),(SELECT id FROM "Items" WHERE "wowheadId"=18861)),
((SELECT id FROM "Bosses" WHERE "name"='Gehennas'),(SELECT id FROM "Items" WHERE "wowheadId"=18875)),
((SELECT id FROM "Bosses" WHERE "name"='Gehennas'),(SELECT id FROM "Items" WHERE "wowheadId"=19147));

-- SELECT 1 AS "Garr";
INSERT INTO "Items" ("name","wowheadId","classId")
VALUES
('Marteau d‘Aurastone',17105,(SELECT id FROM "Classes" WHERE "name"='')),
('Casque cénarien',16834,(SELECT id FROM "Classes" WHERE "name"='Druide')),
('Casque de traqueur de géant',16846,(SELECT id FROM "Classes" WHERE "name"='Chasseur')),
('Déchireur de Gutgore',17071,(SELECT id FROM "Classes" WHERE "name"='')),
('Disque Drillborer',17066,(SELECT id FROM "Classes" WHERE "name"='')),
('Lame de brutalité',18832,(SELECT id FROM "Classes" WHERE "name"='')),
('Casque de puissance',16866,(SELECT id FROM "Classes" WHERE "name"='Guerrier')),
('Collerette de prophétie',16813,(SELECT id FROM "Classes" WHERE "name"='Prêtre')),
('Cornes de Gangrecoeur',16808,(SELECT id FROM "Classes" WHERE "name"='Démoniste')),
('Couronne d‘arcaniste',16795,(SELECT id FROM "Classes" WHERE "name"='Mage')),
('Couvre-chef du tueur de la nuit',16821,(SELECT id FROM "Classes" WHERE "name"='Voleur')),
('Heaume judiciaire',16854,(SELECT id FROM "Classes" WHERE "name"='Paladin')),
('Casque Rageterre',16842,(SELECT id FROM "Classes" WHERE "name"='Chaman'));
-- ('Anneau de frappe rapide',18821,(SELECT id FROM "Classes" WHERE "name"='')),
-- ('Corde de mana enflammé',19136,(SELECT id FROM "Classes" WHERE "name"='')),
-- ('Lame à tranchant d‘obsidienne',18822,(SELECT id FROM "Classes" WHERE "name"='')),
-- ('Talisman de pouvoir éphémère',18820,(SELECT id FROM "Classes" WHERE "name"='')),
-- ('Vieux gants en cuir du Magma',18823,(SELECT id FROM "Classes" WHERE "name"='')),
-- ('Gantelets de garde des flammes',19143,(SELECT id FROM "Classes" WHERE "name"='')),
-- ('Grimoire de runes de feu',19142,(SELECT id FROM "Classes" WHERE "name"='')),
-- ('Bottes durcies dans le magma',18824,(SELECT id FROM "Classes" WHERE "name"='')),
-- ('Cuissards d‘Attise-flammes',18861,(SELECT id FROM "Classes" WHERE "name"='')),
-- ('Spallières de la Terre profonde',18829,(SELECT id FROM "Classes" WHERE "name"=''));

INSERT INTO "BossItem" ("bossId","itemId")
VALUES
((SELECT id FROM "Bosses" WHERE "name"='Garr'),(SELECT id FROM "Items" WHERE "wowheadId"=17105)),
((SELECT id FROM "Bosses" WHERE "name"='Garr'),(SELECT id FROM "Items" WHERE "wowheadId"=16834)),
((SELECT id FROM "Bosses" WHERE "name"='Garr'),(SELECT id FROM "Items" WHERE "wowheadId"=16846)),
((SELECT id FROM "Bosses" WHERE "name"='Garr'),(SELECT id FROM "Items" WHERE "wowheadId"=17071)),
((SELECT id FROM "Bosses" WHERE "name"='Garr'),(SELECT id FROM "Items" WHERE "wowheadId"=17066)),
((SELECT id FROM "Bosses" WHERE "name"='Garr'),(SELECT id FROM "Items" WHERE "wowheadId"=18832)),
((SELECT id FROM "Bosses" WHERE "name"='Garr'),(SELECT id FROM "Items" WHERE "wowheadId"=16866)),
((SELECT id FROM "Bosses" WHERE "name"='Garr'),(SELECT id FROM "Items" WHERE "wowheadId"=16813)),
((SELECT id FROM "Bosses" WHERE "name"='Garr'),(SELECT id FROM "Items" WHERE "wowheadId"=16808)),
((SELECT id FROM "Bosses" WHERE "name"='Garr'),(SELECT id FROM "Items" WHERE "wowheadId"=16795)),
((SELECT id FROM "Bosses" WHERE "name"='Garr'),(SELECT id FROM "Items" WHERE "wowheadId"=16821)),
((SELECT id FROM "Bosses" WHERE "name"='Garr'),(SELECT id FROM "Items" WHERE "wowheadId"=16854)),
((SELECT id FROM "Bosses" WHERE "name"='Garr'),(SELECT id FROM "Items" WHERE "wowheadId"=18821)),
((SELECT id FROM "Bosses" WHERE "name"='Garr'),(SELECT id FROM "Items" WHERE "wowheadId"=19136)),
((SELECT id FROM "Bosses" WHERE "name"='Garr'),(SELECT id FROM "Items" WHERE "wowheadId"=18822)),
((SELECT id FROM "Bosses" WHERE "name"='Garr'),(SELECT id FROM "Items" WHERE "wowheadId"=18820)),
((SELECT id FROM "Bosses" WHERE "name"='Garr'),(SELECT id FROM "Items" WHERE "wowheadId"=18823)),
((SELECT id FROM "Bosses" WHERE "name"='Garr'),(SELECT id FROM "Items" WHERE "wowheadId"=16842)),
((SELECT id FROM "Bosses" WHERE "name"='Garr'),(SELECT id FROM "Items" WHERE "wowheadId"=19143)),
((SELECT id FROM "Bosses" WHERE "name"='Garr'),(SELECT id FROM "Items" WHERE "wowheadId"=19142)),
((SELECT id FROM "Bosses" WHERE "name"='Garr'),(SELECT id FROM "Items" WHERE "wowheadId"=18824)),
((SELECT id FROM "Bosses" WHERE "name"='Garr'),(SELECT id FROM "Items" WHERE "wowheadId"=18861)),
((SELECT id FROM "Bosses" WHERE "name"='Garr'),(SELECT id FROM "Items" WHERE "wowheadId"=18829));

-- SELECT 1 AS "Shazzrah";
INSERT INTO "Items" ("name","wowheadId","classId")
VALUES
('Gants cénariens',16831,(SELECT id FROM "Classes" WHERE "name"='Druide')),
('Gants d‘arcaniste',16801,(SELECT id FROM "Classes" WHERE "name"='Mage')),
('Gants de traqueur de géant',16852,(SELECT id FROM "Classes" WHERE "name"='Chasseur')),
('Bottes de prophétie',16811,(SELECT id FROM "Classes" WHERE "name"='Prêtre')),
('Bottes du tueur de la nuit',16824,(SELECT id FROM "Classes" WHERE "name"='Voleur')),
('Mules de Gangrecoeur',16803,(SELECT id FROM "Classes" WHERE "name"='Démoniste'));
-- ('Ecraseur cramoisi',17077,(SELECT id FROM "Classes" WHERE "name"='')),
-- ('Robe du pouvoir volatil',19145,(SELECT id FROM "Classes" WHERE "name"='')),
-- ('Dague ensorceleuse',18878,(SELECT id FROM "Classes" WHERE "name"='')),
-- ('Anneau de puissance de sort',19147,(SELECT id FROM "Classes" WHERE "name"=''));

INSERT INTO "BossItem" ("bossId","itemId")
VALUES
((SELECT id FROM "Bosses" WHERE "name"='Shazzrah'),(SELECT id FROM "Items" WHERE "wowheadId"=16831)),
((SELECT id FROM "Bosses" WHERE "name"='Shazzrah'),(SELECT id FROM "Items" WHERE "wowheadId"=16801)),
((SELECT id FROM "Bosses" WHERE "name"='Shazzrah'),(SELECT id FROM "Items" WHERE "wowheadId"=16852)),
((SELECT id FROM "Bosses" WHERE "name"='Shazzrah'),(SELECT id FROM "Items" WHERE "wowheadId"=16811)),
((SELECT id FROM "Bosses" WHERE "name"='Shazzrah'),(SELECT id FROM "Items" WHERE "wowheadId"=16824)),
((SELECT id FROM "Bosses" WHERE "name"='Shazzrah'),(SELECT id FROM "Items" WHERE "wowheadId"=16803)),
((SELECT id FROM "Bosses" WHERE "name"='Shazzrah'),(SELECT id FROM "Items" WHERE "wowheadId"=17077)),
((SELECT id FROM "Bosses" WHERE "name"='Shazzrah'),(SELECT id FROM "Items" WHERE "wowheadId"=19145)),
((SELECT id FROM "Bosses" WHERE "name"='Shazzrah'),(SELECT id FROM "Items" WHERE "wowheadId"=18878)),
((SELECT id FROM "Bosses" WHERE "name"='Shazzrah'),(SELECT id FROM "Items" WHERE "wowheadId"=19147));

-- SELECT 1 AS "Baron Geddon";
INSERT INTO "Items" ("name","wowheadId","classId")
VALUES
('Mantelet d‘arcaniste',16797,(SELECT id FROM "Classes" WHERE "name"='Mage')),
('Spallières cénariennes',16836,(SELECT id FROM "Classes" WHERE "name"='Druide')),
('Protège-épaules de Gangrecoeur',16807,(SELECT id FROM "Classes" WHERE "name"='Démoniste')),
('Sceau de l‘archimagus',17110,(SELECT id FROM "Classes" WHERE "name"='')),
('Spallières judiciaires',16856,(SELECT id FROM "Classes" WHERE "name"='Paladin')),
('Epaulettes Rageterre',16844,(SELECT id FROM "Classes" WHERE "name"='Chaman'));
-- ('Anneau de frappe rapide',18821,(SELECT id FROM "Classes" WHERE "name"='')),
-- ('Grimoire de runes de feu',19142,(SELECT id FROM "Classes" WHERE "name"='')),
-- ('Vieux gants en cuir du Magma',18823,(SELECT id FROM "Classes" WHERE "name"='')),
-- ('Lame à tranchant d‘obsidienne',18822,(SELECT id FROM "Classes" WHERE "name"='')),
-- ('Talisman de pouvoir éphémère',18820,(SELECT id FROM "Classes" WHERE "name"='')),
-- ('Bottes durcies dans le magma',18824,(SELECT id FROM "Classes" WHERE "name"='')),
-- ('Corde de mana enflammé',19136,(SELECT id FROM "Classes" WHERE "name"='')),
-- ('Cuissards d‘Attise-flammes',18861,(SELECT id FROM "Classes" WHERE "name"='')),
-- ('Gantelets de garde des flammes',19143,(SELECT id FROM "Classes" WHERE "name"=''));

INSERT INTO "BossItem" ("bossId","itemId")
VALUES
((SELECT id FROM "Bosses" WHERE "name"='Baron Geddon'),(SELECT id FROM "Items" WHERE "wowheadId"=16797)),
((SELECT id FROM "Bosses" WHERE "name"='Baron Geddon'),(SELECT id FROM "Items" WHERE "wowheadId"=16836)),
((SELECT id FROM "Bosses" WHERE "name"='Baron Geddon'),(SELECT id FROM "Items" WHERE "wowheadId"=16807)),
((SELECT id FROM "Bosses" WHERE "name"='Baron Geddon'),(SELECT id FROM "Items" WHERE "wowheadId"=17110)),
((SELECT id FROM "Bosses" WHERE "name"='Baron Geddon'),(SELECT id FROM "Items" WHERE "wowheadId"=16856)),
((SELECT id FROM "Bosses" WHERE "name"='Baron Geddon'),(SELECT id FROM "Items" WHERE "wowheadId"=16844)),
((SELECT id FROM "Bosses" WHERE "name"='Baron Geddon'),(SELECT id FROM "Items" WHERE "wowheadId"=18821)),
((SELECT id FROM "Bosses" WHERE "name"='Baron Geddon'),(SELECT id FROM "Items" WHERE "wowheadId"=19142)),
((SELECT id FROM "Bosses" WHERE "name"='Baron Geddon'),(SELECT id FROM "Items" WHERE "wowheadId"=18823)),
((SELECT id FROM "Bosses" WHERE "name"='Baron Geddon'),(SELECT id FROM "Items" WHERE "wowheadId"=18822)),
((SELECT id FROM "Bosses" WHERE "name"='Baron Geddon'),(SELECT id FROM "Items" WHERE "wowheadId"=18820)),
((SELECT id FROM "Bosses" WHERE "name"='Baron Geddon'),(SELECT id FROM "Items" WHERE "wowheadId"=18824)),
((SELECT id FROM "Bosses" WHERE "name"='Baron Geddon'),(SELECT id FROM "Items" WHERE "wowheadId"=19136)),
((SELECT id FROM "Bosses" WHERE "name"='Baron Geddon'),(SELECT id FROM "Items" WHERE "wowheadId"=18861)),
((SELECT id FROM "Bosses" WHERE "name"='Baron Geddon'),(SELECT id FROM "Items" WHERE "wowheadId"=19143));

-- SELECT 1 AS "Sulfuron Harbinger";
INSERT INTO "Items" ("name","wowheadId","classId")
VALUES
('Frappe-ténèbres',17074,(SELECT id FROM "Classes" WHERE "name"='')),
('Epaulettes de traqueur de géant',16848,(SELECT id FROM "Classes" WHERE "name"='Chasseur')),
('Espauliers de puissance',16868,(SELECT id FROM "Classes" WHERE "name"='Guerrier')),
('Mantelet de prophétie',16816,(SELECT id FROM "Classes" WHERE "name"='Prêtre')),
('Protège-épaules du tueur de la nuit',16823,(SELECT id FROM "Classes" WHERE "name"='Voleur'));
-- ('Anneau de puissance de sort',19147,(SELECT id FROM "Classes" WHERE "name"='')),
-- ('Garde-poignets de stabilité',19146,(SELECT id FROM "Classes" WHERE "name"='')),
-- ('Ecraseur cramoisi',17077,(SELECT id FROM "Classes" WHERE "name"='')),
-- ('Cuissards d‘Attise-flammes',18861,(SELECT id FROM "Classes" WHERE "name"='')),
-- ('Jambières de Tempête de mana',18872,(SELECT id FROM "Classes" WHERE "name"='')),
-- ('Pantalon en écailles de salamandre',18875,(SELECT id FROM "Classes" WHERE "name"='')),
-- ('Anneau épais en sombrefer',18879,(SELECT id FROM "Classes" WHERE "name"='')),
-- ('Dague ensorceleuse',18878,(SELECT id FROM "Classes" WHERE "name"=''));

INSERT INTO "BossItem" ("bossId","itemId")
VALUES
((SELECT id FROM "Bosses" WHERE "name"='Sulfuron Harbinger'),(SELECT id FROM "Items" WHERE "wowheadId"=17074)),
((SELECT id FROM "Bosses" WHERE "name"='Sulfuron Harbinger'),(SELECT id FROM "Items" WHERE "wowheadId"=16848)),
((SELECT id FROM "Bosses" WHERE "name"='Sulfuron Harbinger'),(SELECT id FROM "Items" WHERE "wowheadId"=16868)),
((SELECT id FROM "Bosses" WHERE "name"='Sulfuron Harbinger'),(SELECT id FROM "Items" WHERE "wowheadId"=16816)),
((SELECT id FROM "Bosses" WHERE "name"='Sulfuron Harbinger'),(SELECT id FROM "Items" WHERE "wowheadId"=16823)),
((SELECT id FROM "Bosses" WHERE "name"='Sulfuron Harbinger'),(SELECT id FROM "Items" WHERE "wowheadId"=19147)),
((SELECT id FROM "Bosses" WHERE "name"='Sulfuron Harbinger'),(SELECT id FROM "Items" WHERE "wowheadId"=19146)),
((SELECT id FROM "Bosses" WHERE "name"='Sulfuron Harbinger'),(SELECT id FROM "Items" WHERE "wowheadId"=17077)),
((SELECT id FROM "Bosses" WHERE "name"='Sulfuron Harbinger'),(SELECT id FROM "Items" WHERE "wowheadId"=18861)),
((SELECT id FROM "Bosses" WHERE "name"='Sulfuron Harbinger'),(SELECT id FROM "Items" WHERE "wowheadId"=18872)),
((SELECT id FROM "Bosses" WHERE "name"='Sulfuron Harbinger'),(SELECT id FROM "Items" WHERE "wowheadId"=18875)),
((SELECT id FROM "Bosses" WHERE "name"='Sulfuron Harbinger'),(SELECT id FROM "Items" WHERE "wowheadId"=18879)),
((SELECT id FROM "Bosses" WHERE "name"='Sulfuron Harbinger'),(SELECT id FROM "Items" WHERE "wowheadId"=18878));

-- SELECT 1 AS "Golemagg the Incinerator";
INSERT INTO "Items" ("name","wowheadId","classId")
VALUES
('Bâton de domination',18842,(SELECT id FROM "Classes" WHERE "name"='')),
('Magelame de Chante-azur',17103,(SELECT id FROM "Classes" WHERE "name"='')),
('Robe d‘arcaniste',16798,(SELECT id FROM "Classes" WHERE "name"='Mage')),
('Cuirasse de traqueur de géant',16845,(SELECT id FROM "Classes" WHERE "name"='Chasseur')),
('Plastron du tueur de la nuit',16820,(SELECT id FROM "Classes" WHERE "name"='Voleur')),
('Robe de Gangrecoeur',16809,(SELECT id FROM "Classes" WHERE "name"='Démoniste')),
('Robe de prophétie',16815,(SELECT id FROM "Classes" WHERE "name"='Prêtre')),
('Cuirasse de puissance',16865,(SELECT id FROM "Classes" WHERE "name"='Guerrier')),
('Lance-grenaille explosif',17072,(SELECT id FROM "Classes" WHERE "name"='')),
('Lingot de sulfuron',17203,(SELECT id FROM "Classes" WHERE "name"='')),
('Corselet judiciaire',16853,(SELECT id FROM "Classes" WHERE "name"='Paladin')),
('Habit cénarien',16833,(SELECT id FROM "Classes" WHERE "name"='Druide')),
('Habit Rageterre',16841,(SELECT id FROM "Classes" WHERE "name"='Chaman'));
-- ('Vieux gants en cuir du Magma',18823,(SELECT id FROM "Classes" WHERE "name"='')),
-- ('Gantelets de garde des flammes',19143,(SELECT id FROM "Classes" WHERE "name"='')),
-- ('Lame à tranchant d‘obsidienne',18822,(SELECT id FROM "Classes" WHERE "name"='')),
-- ('Anneau de frappe rapide',18821,(SELECT id FROM "Classes" WHERE "name"='')),
-- ('Cuissards d‘Attise-flammes',18861,(SELECT id FROM "Classes" WHERE "name"='')),
-- ('Corde de mana enflammé',19136,(SELECT id FROM "Classes" WHERE "name"='')),
-- ('Grimoire de runes de feu',19142,(SELECT id FROM "Classes" WHERE "name"='')),
-- ('Talisman de pouvoir éphémère',18820,(SELECT id FROM "Classes" WHERE "name"=''));

INSERT INTO "BossItem" ("bossId","itemId")
VALUES
((SELECT id FROM "Bosses" WHERE "name"='Golemagg the Incinerator'),(SELECT id FROM "Items" WHERE "wowheadId"=18842)),
((SELECT id FROM "Bosses" WHERE "name"='Golemagg the Incinerator'),(SELECT id FROM "Items" WHERE "wowheadId"=17103)),
((SELECT id FROM "Bosses" WHERE "name"='Golemagg the Incinerator'),(SELECT id FROM "Items" WHERE "wowheadId"=16798)),
((SELECT id FROM "Bosses" WHERE "name"='Golemagg the Incinerator'),(SELECT id FROM "Items" WHERE "wowheadId"=16845)),
((SELECT id FROM "Bosses" WHERE "name"='Golemagg the Incinerator'),(SELECT id FROM "Items" WHERE "wowheadId"=16820)),
((SELECT id FROM "Bosses" WHERE "name"='Golemagg the Incinerator'),(SELECT id FROM "Items" WHERE "wowheadId"=16809)),
((SELECT id FROM "Bosses" WHERE "name"='Golemagg the Incinerator'),(SELECT id FROM "Items" WHERE "wowheadId"=16815)),
((SELECT id FROM "Bosses" WHERE "name"='Golemagg the Incinerator'),(SELECT id FROM "Items" WHERE "wowheadId"=16865)),
((SELECT id FROM "Bosses" WHERE "name"='Golemagg the Incinerator'),(SELECT id FROM "Items" WHERE "wowheadId"=17072)),
((SELECT id FROM "Bosses" WHERE "name"='Golemagg the Incinerator'),(SELECT id FROM "Items" WHERE "wowheadId"=17203)),
((SELECT id FROM "Bosses" WHERE "name"='Golemagg the Incinerator'),(SELECT id FROM "Items" WHERE "wowheadId"=16853)),
((SELECT id FROM "Bosses" WHERE "name"='Golemagg the Incinerator'),(SELECT id FROM "Items" WHERE "wowheadId"=16833)),
((SELECT id FROM "Bosses" WHERE "name"='Golemagg the Incinerator'),(SELECT id FROM "Items" WHERE "wowheadId"=16841)),
((SELECT id FROM "Bosses" WHERE "name"='Golemagg the Incinerator'),(SELECT id FROM "Items" WHERE "wowheadId"=18823)),
((SELECT id FROM "Bosses" WHERE "name"='Golemagg the Incinerator'),(SELECT id FROM "Items" WHERE "wowheadId"=19143)),
((SELECT id FROM "Bosses" WHERE "name"='Golemagg the Incinerator'),(SELECT id FROM "Items" WHERE "wowheadId"=18822)),
((SELECT id FROM "Bosses" WHERE "name"='Golemagg the Incinerator'),(SELECT id FROM "Items" WHERE "wowheadId"=18821)),
((SELECT id FROM "Bosses" WHERE "name"='Golemagg the Incinerator'),(SELECT id FROM "Items" WHERE "wowheadId"=18861)),
((SELECT id FROM "Bosses" WHERE "name"='Golemagg the Incinerator'),(SELECT id FROM "Items" WHERE "wowheadId"=19136)),
((SELECT id FROM "Bosses" WHERE "name"='Golemagg the Incinerator'),(SELECT id FROM "Items" WHERE "wowheadId"=19142)),
((SELECT id FROM "Bosses" WHERE "name"='Golemagg the Incinerator'),(SELECT id FROM "Items" WHERE "wowheadId"=18820));

-- SELECT 1 AS "Majordomo Executus";
INSERT INTO "Items" ("name","wowheadId","classId")
VALUES
('Dent de chien du magma',18805,(SELECT id FROM "Classes" WHERE "name"='')),
('Feuille ancienne pétrifiée',18703,(SELECT id FROM "Classes" WHERE "name"='Chasseur')),
('Cape ignifugée',18811,(SELECT id FROM "Classes" WHERE "name"='')),
('Echarpe des secrets murmurés',18809,(SELECT id FROM "Classes" WHERE "name"='')),
('Garde-poignets de vrai vol',18812,(SELECT id FROM "Classes" WHERE "name"='')),
('L‘Oeil de la divinité',18646,(SELECT id FROM "Classes" WHERE "name"='Prêtre')),
('Spallières de croissance sauvage',18810,(SELECT id FROM "Classes" WHERE "name"=''));

INSERT INTO "BossItem" ("bossId","itemId")
VALUES
((SELECT id FROM "Bosses" WHERE "name"='Majordomo Executus'),(SELECT id FROM "Items" WHERE "wowheadId"=18805)),
((SELECT id FROM "Bosses" WHERE "name"='Majordomo Executus'),(SELECT id FROM "Items" WHERE "wowheadId"=18703)),
((SELECT id FROM "Bosses" WHERE "name"='Majordomo Executus'),(SELECT id FROM "Items" WHERE "wowheadId"=18811)),
((SELECT id FROM "Bosses" WHERE "name"='Majordomo Executus'),(SELECT id FROM "Items" WHERE "wowheadId"=18809)),
((SELECT id FROM "Bosses" WHERE "name"='Majordomo Executus'),(SELECT id FROM "Items" WHERE "wowheadId"=18812)),
((SELECT id FROM "Bosses" WHERE "name"='Majordomo Executus'),(SELECT id FROM "Items" WHERE "wowheadId"=18646)),
((SELECT id FROM "Bosses" WHERE "name"='Majordomo Executus'),(SELECT id FROM "Items" WHERE "wowheadId"=18810));

-- SELECT 1 AS "Ragnaros";
INSERT INTO "Items" ("name","wowheadId","classId")
VALUES
('Jambières de Stormrage',16901,(SELECT id FROM "Classes" WHERE "name"='Druide')),
('Pantalon de Vent du néant',16915,(SELECT id FROM "Classes" WHERE "name"='Mage')),
('Lame de la perdition',18816,(SELECT id FROM "Classes" WHERE "name"='')),
('Anneau de Sulfuras',19138,(SELECT id FROM "Classes" WHERE "name"='')),
('Jambières de traqueur de dragon',16938,(SELECT id FROM "Classes" WHERE "name"='Chasseur')),
('Couronne de destruction',18817,(SELECT id FROM "Classes" WHERE "name"='')),
('Pantalon Rougecroc',16909,(SELECT id FROM "Classes" WHERE "name"='Voleur')),
('Anneau de Précisia',17063,(SELECT id FROM "Classes" WHERE "name"='')),
('Cape sang-de-dragon',17107,(SELECT id FROM "Classes" WHERE "name"='')),
('Essence de la Flamme pure',18815,(SELECT id FROM "Classes" WHERE "name"='')),
('Jambières de Némésis',16930,(SELECT id FROM "Classes" WHERE "name"='Démoniste')),
('Jambières de transcendance',16922,(SELECT id FROM "Classes" WHERE "name"='Prêtre')),
('Jambières de courroux',16962,(SELECT id FROM "Classes" WHERE "name"='Guerrier')),
('Cape du Voile de brume',17102,(SELECT id FROM "Classes" WHERE "name"='')),
('Ceinturon d‘assaut',19137,(SELECT id FROM "Classes" WHERE "name"='')),
('Collier du Seigneur du Feu',18814,(SELECT id FROM "Classes" WHERE "name"='')),
('Jambières du jugement',16954,(SELECT id FROM "Classes" WHERE "name"='Paladin')),
('Arrache-moelle',17104,(SELECT id FROM "Classes" WHERE "name"='')),
('Fragment de la Flamme',17082,(SELECT id FROM "Classes" WHERE "name"='')),
('Fléau de Bonereaver',17076,(SELECT id FROM "Classes" WHERE "name"='')),
('Jambières des dix tempêtes',16946,(SELECT id FROM "Classes" WHERE "name"='Chaman'));

INSERT INTO "BossItem" ("bossId","itemId")
VALUES
((SELECT id FROM "Bosses" WHERE "name"='Ragnaros'),(SELECT id FROM "Items" WHERE "wowheadId"=16901)),
((SELECT id FROM "Bosses" WHERE "name"='Ragnaros'),(SELECT id FROM "Items" WHERE "wowheadId"=16915)),
((SELECT id FROM "Bosses" WHERE "name"='Ragnaros'),(SELECT id FROM "Items" WHERE "wowheadId"=18816)),
((SELECT id FROM "Bosses" WHERE "name"='Ragnaros'),(SELECT id FROM "Items" WHERE "wowheadId"=19138)),
((SELECT id FROM "Bosses" WHERE "name"='Ragnaros'),(SELECT id FROM "Items" WHERE "wowheadId"=16938)),
((SELECT id FROM "Bosses" WHERE "name"='Ragnaros'),(SELECT id FROM "Items" WHERE "wowheadId"=18817)),
((SELECT id FROM "Bosses" WHERE "name"='Ragnaros'),(SELECT id FROM "Items" WHERE "wowheadId"=16909)),
((SELECT id FROM "Bosses" WHERE "name"='Ragnaros'),(SELECT id FROM "Items" WHERE "wowheadId"=17063)),
((SELECT id FROM "Bosses" WHERE "name"='Ragnaros'),(SELECT id FROM "Items" WHERE "wowheadId"=17107)),
((SELECT id FROM "Bosses" WHERE "name"='Ragnaros'),(SELECT id FROM "Items" WHERE "wowheadId"=18815)),
((SELECT id FROM "Bosses" WHERE "name"='Ragnaros'),(SELECT id FROM "Items" WHERE "wowheadId"=16930)),
((SELECT id FROM "Bosses" WHERE "name"='Ragnaros'),(SELECT id FROM "Items" WHERE "wowheadId"=16922)),
((SELECT id FROM "Bosses" WHERE "name"='Ragnaros'),(SELECT id FROM "Items" WHERE "wowheadId"=16962)),
((SELECT id FROM "Bosses" WHERE "name"='Ragnaros'),(SELECT id FROM "Items" WHERE "wowheadId"=17102)),
((SELECT id FROM "Bosses" WHERE "name"='Ragnaros'),(SELECT id FROM "Items" WHERE "wowheadId"=19137)),
((SELECT id FROM "Bosses" WHERE "name"='Ragnaros'),(SELECT id FROM "Items" WHERE "wowheadId"=18814)),
((SELECT id FROM "Bosses" WHERE "name"='Ragnaros'),(SELECT id FROM "Items" WHERE "wowheadId"=16954)),
((SELECT id FROM "Bosses" WHERE "name"='Ragnaros'),(SELECT id FROM "Items" WHERE "wowheadId"=17104)),
((SELECT id FROM "Bosses" WHERE "name"='Ragnaros'),(SELECT id FROM "Items" WHERE "wowheadId"=17082)),
((SELECT id FROM "Bosses" WHERE "name"='Ragnaros'),(SELECT id FROM "Items" WHERE "wowheadId"=17076)),
((SELECT id FROM "Bosses" WHERE "name"='Ragnaros'),(SELECT id FROM "Items" WHERE "wowheadId"=16946));

-- SELECT 1 AS "Onyxia";
INSERT INTO "Items" ("name","wowheadId","classId")
VALUES
('Tête d‘Onyxia',18422,(SELECT id FROM "Classes" WHERE "name"='')),
('Tendon de dragon noir adulte',18705,(SELECT id FROM "Classes" WHERE "name"='Chasseur')),
('Ancien Grimoire de Cornerstone',17067,(SELECT id FROM "Classes" WHERE "name"='')),
('Anneau de lien',18813,(SELECT id FROM "Classes" WHERE "name"='')),
('Couvre-chef de Stormrage',16900,(SELECT id FROM "Classes" WHERE "name"='Druide')),
('Crâne de Némésis',16929,(SELECT id FROM "Classes" WHERE "name"='Démoniste')),
('Casque de traqueur de dragon',16939,(SELECT id FROM "Classes" WHERE "name"='Chasseur')),
('Couronne de Vent du néant',16914,(SELECT id FROM "Classes" WHERE "name"='Mage')),
('Drapé de Saphiron',17078,(SELECT id FROM "Classes" WHERE "name"='')),
('Auréole de transcendance',16921,(SELECT id FROM "Classes" WHERE "name"='Prêtre')),
('Cagoule Rougecroc',16908,(SELECT id FROM "Classes" WHERE "name"='Voleur')),
('Heaume de courroux',16963,(SELECT id FROM "Classes" WHERE "name"='Guerrier')),
('Collier d‘Eskhandar',18205,(SELECT id FROM "Classes" WHERE "name"='')),
('Couronne du jugement',16955,(SELECT id FROM "Classes" WHERE "name"='Paladin')),
('Casque des dix tempêtes',16947,(SELECT id FROM "Classes" WHERE "name"='Chaman')),
('Eclat de l‘Ecaille',17064,(SELECT id FROM "Classes" WHERE "name"='')),
('Porte-mort',17068,(SELECT id FROM "Classes" WHERE "name"='')),
('Tête d‘Onyxia',18423,(SELECT id FROM "Classes" WHERE "name"='')),
('Vis‘kag le Saigneur',17075,(SELECT id FROM "Classes" WHERE "name"=''));

INSERT INTO "BossItem" ("bossId","itemId")
VALUES
((SELECT id FROM "Bosses" WHERE "name"='Onyxia'),(SELECT id FROM "Items" WHERE "wowheadId"=18422)),
((SELECT id FROM "Bosses" WHERE "name"='Onyxia'),(SELECT id FROM "Items" WHERE "wowheadId"=18705)),
((SELECT id FROM "Bosses" WHERE "name"='Onyxia'),(SELECT id FROM "Items" WHERE "wowheadId"=17067)),
((SELECT id FROM "Bosses" WHERE "name"='Onyxia'),(SELECT id FROM "Items" WHERE "wowheadId"=18813)),
((SELECT id FROM "Bosses" WHERE "name"='Onyxia'),(SELECT id FROM "Items" WHERE "wowheadId"=16900)),
((SELECT id FROM "Bosses" WHERE "name"='Onyxia'),(SELECT id FROM "Items" WHERE "wowheadId"=16929)),
((SELECT id FROM "Bosses" WHERE "name"='Onyxia'),(SELECT id FROM "Items" WHERE "wowheadId"=16939)),
((SELECT id FROM "Bosses" WHERE "name"='Onyxia'),(SELECT id FROM "Items" WHERE "wowheadId"=16914)),
((SELECT id FROM "Bosses" WHERE "name"='Onyxia'),(SELECT id FROM "Items" WHERE "wowheadId"=17078)),
((SELECT id FROM "Bosses" WHERE "name"='Onyxia'),(SELECT id FROM "Items" WHERE "wowheadId"=16921)),
((SELECT id FROM "Bosses" WHERE "name"='Onyxia'),(SELECT id FROM "Items" WHERE "wowheadId"=16908)),
((SELECT id FROM "Bosses" WHERE "name"='Onyxia'),(SELECT id FROM "Items" WHERE "wowheadId"=16963)),
((SELECT id FROM "Bosses" WHERE "name"='Onyxia'),(SELECT id FROM "Items" WHERE "wowheadId"=18205)),
((SELECT id FROM "Bosses" WHERE "name"='Onyxia'),(SELECT id FROM "Items" WHERE "wowheadId"=16955)),
((SELECT id FROM "Bosses" WHERE "name"='Onyxia'),(SELECT id FROM "Items" WHERE "wowheadId"=16947)),
((SELECT id FROM "Bosses" WHERE "name"='Onyxia'),(SELECT id FROM "Items" WHERE "wowheadId"=17064)),
((SELECT id FROM "Bosses" WHERE "name"='Onyxia'),(SELECT id FROM "Items" WHERE "wowheadId"=17068)),
((SELECT id FROM "Bosses" WHERE "name"='Onyxia'),(SELECT id FROM "Items" WHERE "wowheadId"=18423)),
((SELECT id FROM "Bosses" WHERE "name"='Onyxia'),(SELECT id FROM "Items" WHERE "wowheadId"=17075));
