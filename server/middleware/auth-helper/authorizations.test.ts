import {
  checkRights,
  getMutation,
  isMutation,
  isQuery,
  isSchemaIntrospect
} from "./authorizations";
import queries from "./query-example";
const {
  BROKEN_QUERY,
  QUERY_BOSSITEMS,
  QUERY_BOSSES,
  QUERY_CLASSITEMS,
  QUERY_CLASSES,
  QUERY_DONJONS,
  QUERY_ITEMS,
  QUERY_LOOTS,
  QUERY_MERITS,
  QUERY_PLAYERMERITS,
  QUERY_PLAYERSLOTS,
  QUERY_PLAYERS,
  QUERY_RAIDPLAYERS,
  QUERY_RAIDS,
  QUERY_SLOTS,
  BROKEN_MUTATION,
  MUTATION_BOSS,
  MUTATION_BOSSITEM,
  MUTATION_CLASS,
  MUTATION_CLASSITEM,
  MUTATION_DONJON,
  MUTATION_ITEM,
  MUTATION_LOOT,
  MUTATION_MERIT,
  MUTATION_PLAYER,
  MUTATION_PLAYERMERIT,
  MUTATION_PLAYERSLOT,
  MUTATION_RAID,
  MUTATION_RAIDPLAYER,
  MUTATION_SLOT,
  QUERY_MUTATION,
  MULTIPLE_MUTATION,
  MULTIPLE_SAME_MUTATION,
  INTROSPECTION_QUERY
} = queries;

describe("authorization middleware helpers", () => {
  it("should detect correctly a queries", () => {
    expect(isQuery(BROKEN_QUERY)).toBe(false);
    expect(isQuery(QUERY_BOSSITEMS)).toBe(true);
    expect(isQuery(QUERY_BOSSES)).toBe(true);
    expect(isQuery(QUERY_CLASSITEMS)).toBe(true);
    expect(isQuery(QUERY_CLASSES)).toBe(true);
    expect(isQuery(QUERY_DONJONS)).toBe(true);
    expect(isQuery(QUERY_ITEMS)).toBe(true);
    expect(isQuery(QUERY_LOOTS)).toBe(true);
    expect(isQuery(QUERY_MERITS)).toBe(true);
    expect(isQuery(QUERY_PLAYERMERITS)).toBe(true);
    expect(isQuery(QUERY_PLAYERSLOTS)).toBe(true);
    expect(isQuery(QUERY_PLAYERS)).toBe(true);
    expect(isQuery(QUERY_RAIDPLAYERS)).toBe(true);
    expect(isQuery(QUERY_RAIDS)).toBe(true);
    expect(isQuery(QUERY_SLOTS)).toBe(true);
    expect(isQuery(BROKEN_MUTATION)).toBe(false);
    expect(isQuery(MUTATION_BOSS)).toBe(false);
    expect(isQuery(MUTATION_BOSSITEM)).toBe(false);
    expect(isQuery(MUTATION_CLASS)).toBe(false);
    expect(isQuery(MUTATION_CLASSITEM)).toBe(false);
    expect(isQuery(MUTATION_DONJON)).toBe(false);
    expect(isQuery(MUTATION_ITEM)).toBe(false);
    expect(isQuery(MUTATION_LOOT)).toBe(false);
    expect(isQuery(MUTATION_MERIT)).toBe(false);
    expect(isQuery(MUTATION_PLAYER)).toBe(false);
    expect(isQuery(MUTATION_PLAYERMERIT)).toBe(false);
    expect(isQuery(MUTATION_PLAYERSLOT)).toBe(false);
    expect(isQuery(MUTATION_RAID)).toBe(false);
    expect(isQuery(MUTATION_RAIDPLAYER)).toBe(false);
    expect(isQuery(MUTATION_SLOT)).toBe(false);
    expect(isQuery(QUERY_MUTATION)).toBe(false);
    expect(isQuery(MULTIPLE_MUTATION)).toBe(false);
    expect(isQuery(MULTIPLE_SAME_MUTATION)).toBe(false);
    expect(isQuery(INTROSPECTION_QUERY)).toBe(true);
  });
  it("should detect correctly a mutations", () => {
    expect(isMutation(BROKEN_QUERY)).toBe(false);
    expect(isMutation(QUERY_BOSSITEMS)).toBe(false);
    expect(isMutation(QUERY_BOSSES)).toBe(false);
    expect(isMutation(QUERY_CLASSITEMS)).toBe(false);
    expect(isMutation(QUERY_CLASSES)).toBe(false);
    expect(isMutation(QUERY_DONJONS)).toBe(false);
    expect(isMutation(QUERY_ITEMS)).toBe(false);
    expect(isMutation(QUERY_LOOTS)).toBe(false);
    expect(isMutation(QUERY_MERITS)).toBe(false);
    expect(isMutation(QUERY_PLAYERMERITS)).toBe(false);
    expect(isMutation(QUERY_PLAYERSLOTS)).toBe(false);
    expect(isMutation(QUERY_PLAYERS)).toBe(false);
    expect(isMutation(QUERY_RAIDPLAYERS)).toBe(false);
    expect(isMutation(QUERY_RAIDS)).toBe(false);
    expect(isMutation(QUERY_SLOTS)).toBe(false);
    expect(isMutation(BROKEN_MUTATION)).toBe(false);
    expect(isMutation(MUTATION_BOSS)).toBe(true);
    expect(isMutation(MUTATION_BOSSITEM)).toBe(true);
    expect(isMutation(MUTATION_CLASS)).toBe(true);
    expect(isMutation(MUTATION_CLASSITEM)).toBe(true);
    expect(isMutation(MUTATION_DONJON)).toBe(true);
    expect(isMutation(MUTATION_ITEM)).toBe(true);
    expect(isMutation(MUTATION_LOOT)).toBe(true);
    expect(isMutation(MUTATION_MERIT)).toBe(true);
    expect(isMutation(MUTATION_PLAYER)).toBe(true);
    expect(isMutation(MUTATION_PLAYERMERIT)).toBe(true);
    expect(isMutation(MUTATION_PLAYERSLOT)).toBe(true);
    expect(isMutation(MUTATION_RAID)).toBe(true);
    expect(isMutation(MUTATION_RAIDPLAYER)).toBe(true);
    expect(isMutation(MUTATION_SLOT)).toBe(true);
    expect(isMutation(QUERY_MUTATION)).toBe(false);
    expect(isMutation(MULTIPLE_MUTATION)).toBe(true);
    expect(isMutation(MULTIPLE_SAME_MUTATION)).toBe(true);
    expect(isMutation(INTROSPECTION_QUERY)).toBe(false);
  });
  it("should retreive correctly all found mutations", () => {
    expect(getMutation(BROKEN_QUERY)).toEqual([]);
    expect(getMutation(QUERY_BOSSITEMS)).toEqual([]);
    expect(getMutation(QUERY_BOSSES)).toEqual([]);
    expect(getMutation(QUERY_CLASSITEMS)).toEqual([]);
    expect(getMutation(QUERY_CLASSES)).toEqual([]);
    expect(getMutation(QUERY_DONJONS)).toEqual([]);
    expect(getMutation(QUERY_ITEMS)).toEqual([]);
    expect(getMutation(QUERY_LOOTS)).toEqual([]);
    expect(getMutation(QUERY_MERITS)).toEqual([]);
    expect(getMutation(QUERY_PLAYERMERITS)).toEqual([]);
    expect(getMutation(QUERY_PLAYERSLOTS)).toEqual([]);
    expect(getMutation(QUERY_PLAYERS)).toEqual([]);
    expect(getMutation(QUERY_RAIDPLAYERS)).toEqual([]);
    expect(getMutation(QUERY_RAIDS)).toEqual([]);
    expect(getMutation(QUERY_SLOTS)).toEqual([]);
    expect(getMutation(BROKEN_MUTATION)).toEqual([]);
    expect(getMutation(MUTATION_BOSS)).toEqual(["createBoss"]);
    expect(getMutation(MUTATION_BOSSITEM)).toEqual(["createBossItem"]);
    expect(getMutation(MUTATION_CLASS)).toEqual(["createClass"]);
    expect(getMutation(MUTATION_CLASSITEM)).toEqual(["createClassItem"]);
    expect(getMutation(MUTATION_DONJON)).toEqual(["createDonjon"]);
    expect(getMutation(MUTATION_ITEM)).toEqual(["createItem"]);
    expect(getMutation(MUTATION_LOOT)).toEqual(["createLoot"]);
    expect(getMutation(MUTATION_MERIT)).toEqual(["createMerit"]);
    expect(getMutation(MUTATION_PLAYER)).toEqual(["createPlayer"]);
    expect(getMutation(MUTATION_PLAYERMERIT)).toEqual(["createPlayerMerit"]);
    expect(getMutation(MUTATION_PLAYERSLOT)).toEqual(["createPlayerSlot"]);
    expect(getMutation(MUTATION_RAID)).toEqual(["createRaid"]);
    expect(getMutation(MUTATION_RAIDPLAYER)).toEqual(["createRaidPlayer"]);
    expect(getMutation(MUTATION_SLOT)).toEqual(["createSlot"]);
    expect(getMutation(QUERY_MUTATION)).toEqual([]);
    expect(getMutation(MULTIPLE_MUTATION)).toEqual([
      "createRaidPlayer",
      "createSlot"
    ]);
    expect(getMutation(MULTIPLE_SAME_MUTATION)).toEqual([
      "createSlot",
      "createSlot"
    ]);
    expect(getMutation(INTROSPECTION_QUERY)).toEqual([]);
  });
  it("should detect if shema is just introspect", () => {
    expect(isSchemaIntrospect(QUERY_MUTATION)).toBe(false);
    expect(isSchemaIntrospect(INTROSPECTION_QUERY)).toBe(true);
  });
});

describe("exposed rights", () => {
  it("should manage admin rights correctly", () => {
    expect(checkRights("admin", BROKEN_QUERY)).toBe(false);
    expect(checkRights("admin", QUERY_BOSSITEMS)).toBe(true);
    expect(checkRights("admin", QUERY_BOSSES)).toBe(true);
    expect(checkRights("admin", QUERY_CLASSITEMS)).toBe(true);
    expect(checkRights("admin", QUERY_CLASSES)).toBe(true);
    expect(checkRights("admin", QUERY_DONJONS)).toBe(true);
    expect(checkRights("admin", QUERY_ITEMS)).toBe(true);
    expect(checkRights("admin", QUERY_LOOTS)).toBe(true);
    expect(checkRights("admin", QUERY_MERITS)).toBe(true);
    expect(checkRights("admin", QUERY_PLAYERMERITS)).toBe(true);
    expect(checkRights("admin", QUERY_PLAYERSLOTS)).toBe(true);
    expect(checkRights("admin", QUERY_PLAYERS)).toBe(true);
    expect(checkRights("admin", QUERY_RAIDPLAYERS)).toBe(true);
    expect(checkRights("admin", QUERY_RAIDS)).toBe(true);
    expect(checkRights("admin", QUERY_SLOTS)).toBe(true);
    expect(checkRights("admin", BROKEN_MUTATION)).toBe(false);
    expect(checkRights("admin", MUTATION_BOSS)).toBe(true);
    expect(checkRights("admin", MUTATION_BOSSITEM)).toBe(true);
    expect(checkRights("admin", MUTATION_CLASS)).toBe(true);
    expect(checkRights("admin", MUTATION_CLASSITEM)).toBe(true);
    expect(checkRights("admin", MUTATION_DONJON)).toBe(true);
    expect(checkRights("admin", MUTATION_ITEM)).toBe(true);
    expect(checkRights("admin", MUTATION_LOOT)).toBe(true);
    expect(checkRights("admin", MUTATION_MERIT)).toBe(true);
    expect(checkRights("admin", MUTATION_PLAYER)).toBe(true);
    expect(checkRights("admin", MUTATION_PLAYERMERIT)).toBe(true);
    expect(checkRights("admin", MUTATION_PLAYERSLOT)).toBe(true);
    expect(checkRights("admin", MUTATION_RAID)).toBe(true);
    expect(checkRights("admin", MUTATION_RAIDPLAYER)).toBe(true);
    expect(checkRights("admin", MUTATION_SLOT)).toBe(true);
    expect(checkRights("admin", QUERY_MUTATION)).toBe(false);
    expect(checkRights("admin", MULTIPLE_MUTATION)).toBe(false);
    expect(checkRights("admin", MULTIPLE_SAME_MUTATION)).toBe(false);
  });
  it("should manage officer rights correctly", () => {
    expect(checkRights("officer", BROKEN_QUERY)).toBe(false);
    expect(checkRights("officer", QUERY_BOSSITEMS)).toBe(true);
    expect(checkRights("officer", QUERY_BOSSES)).toBe(true);
    expect(checkRights("officer", QUERY_CLASSITEMS)).toBe(true);
    expect(checkRights("officer", QUERY_CLASSES)).toBe(true);
    expect(checkRights("officer", QUERY_DONJONS)).toBe(true);
    expect(checkRights("officer", QUERY_ITEMS)).toBe(true);
    expect(checkRights("officer", QUERY_LOOTS)).toBe(true);
    expect(checkRights("officer", QUERY_MERITS)).toBe(true);
    expect(checkRights("officer", QUERY_PLAYERMERITS)).toBe(true);
    expect(checkRights("officer", QUERY_PLAYERSLOTS)).toBe(true);
    expect(checkRights("officer", QUERY_PLAYERS)).toBe(true);
    expect(checkRights("officer", QUERY_RAIDPLAYERS)).toBe(true);
    expect(checkRights("officer", QUERY_RAIDS)).toBe(true);
    expect(checkRights("officer", QUERY_SLOTS)).toBe(true);
    expect(checkRights("officer", BROKEN_MUTATION)).toBe(false);
    expect(checkRights("officer", MUTATION_BOSS)).toBe(false);
    expect(checkRights("officer", MUTATION_BOSSITEM)).toBe(false);
    expect(checkRights("officer", MUTATION_CLASS)).toBe(false);
    expect(checkRights("officer", MUTATION_CLASSITEM)).toBe(true);
    expect(checkRights("officer", MUTATION_DONJON)).toBe(false);
    expect(checkRights("officer", MUTATION_ITEM)).toBe(false);
    expect(checkRights("officer", MUTATION_LOOT)).toBe(true);
    expect(checkRights("officer", MUTATION_MERIT)).toBe(false);
    expect(checkRights("officer", MUTATION_PLAYER)).toBe(false);
    expect(checkRights("officer", MUTATION_PLAYERMERIT)).toBe(true);
    expect(checkRights("officer", MUTATION_PLAYERSLOT)).toBe(true);
    expect(checkRights("officer", MUTATION_RAID)).toBe(true);
    expect(checkRights("officer", MUTATION_RAIDPLAYER)).toBe(true);
    expect(checkRights("officer", MUTATION_SLOT)).toBe(false);
    expect(checkRights("officer", QUERY_MUTATION)).toBe(false);
    expect(checkRights("officer", MULTIPLE_MUTATION)).toBe(false);
    expect(checkRights("officer", MULTIPLE_SAME_MUTATION)).toBe(false);
  });
  it("should manage classMaster rights correctly", () => {
    expect(checkRights("classMaster", BROKEN_QUERY)).toBe(false);
    expect(checkRights("classMaster", QUERY_BOSSITEMS)).toBe(true);
    expect(checkRights("classMaster", QUERY_BOSSES)).toBe(true);
    expect(checkRights("classMaster", QUERY_CLASSITEMS)).toBe(true);
    expect(checkRights("classMaster", QUERY_CLASSES)).toBe(true);
    expect(checkRights("classMaster", QUERY_DONJONS)).toBe(true);
    expect(checkRights("classMaster", QUERY_ITEMS)).toBe(true);
    expect(checkRights("classMaster", QUERY_LOOTS)).toBe(true);
    expect(checkRights("classMaster", QUERY_MERITS)).toBe(true);
    expect(checkRights("classMaster", QUERY_PLAYERMERITS)).toBe(true);
    expect(checkRights("classMaster", QUERY_PLAYERSLOTS)).toBe(true);
    expect(checkRights("classMaster", QUERY_PLAYERS)).toBe(true);
    expect(checkRights("classMaster", QUERY_RAIDPLAYERS)).toBe(true);
    expect(checkRights("classMaster", QUERY_RAIDS)).toBe(true);
    expect(checkRights("classMaster", QUERY_SLOTS)).toBe(true);
    expect(checkRights("classMaster", BROKEN_MUTATION)).toBe(false);
    expect(checkRights("classMaster", MUTATION_BOSS)).toBe(false);
    expect(checkRights("classMaster", MUTATION_BOSSITEM)).toBe(false);
    expect(checkRights("classMaster", MUTATION_CLASS)).toBe(false);
    expect(checkRights("classMaster", MUTATION_CLASSITEM)).toBe(false);
    expect(checkRights("classMaster", MUTATION_DONJON)).toBe(false);
    expect(checkRights("classMaster", MUTATION_ITEM)).toBe(false);
    expect(checkRights("classMaster", MUTATION_LOOT)).toBe(true);
    expect(checkRights("classMaster", MUTATION_MERIT)).toBe(false);
    expect(checkRights("classMaster", MUTATION_PLAYER)).toBe(false);
    expect(checkRights("classMaster", MUTATION_PLAYERMERIT)).toBe(true);
    expect(checkRights("classMaster", MUTATION_PLAYERSLOT)).toBe(true);
    expect(checkRights("classMaster", MUTATION_RAID)).toBe(false);
    expect(checkRights("classMaster", MUTATION_RAIDPLAYER)).toBe(false);
    expect(checkRights("classMaster", MUTATION_SLOT)).toBe(false);
    expect(checkRights("classMaster", QUERY_MUTATION)).toBe(false);
    expect(checkRights("classMaster", MULTIPLE_MUTATION)).toBe(false);
    expect(checkRights("classMaster", MULTIPLE_SAME_MUTATION)).toBe(false);
  });
  it("should manage player rights correctly", () => {
    expect(checkRights("player", BROKEN_QUERY)).toBe(false);
    expect(checkRights("player", QUERY_BOSSITEMS)).toBe(true);
    expect(checkRights("player", QUERY_BOSSES)).toBe(true);
    expect(checkRights("player", QUERY_CLASSITEMS)).toBe(true);
    expect(checkRights("player", QUERY_CLASSES)).toBe(true);
    expect(checkRights("player", QUERY_DONJONS)).toBe(true);
    expect(checkRights("player", QUERY_ITEMS)).toBe(true);
    expect(checkRights("player", QUERY_LOOTS)).toBe(true);
    expect(checkRights("player", QUERY_MERITS)).toBe(true);
    expect(checkRights("player", QUERY_PLAYERMERITS)).toBe(true);
    expect(checkRights("player", QUERY_PLAYERSLOTS)).toBe(true);
    expect(checkRights("player", QUERY_PLAYERS)).toBe(true);
    expect(checkRights("player", QUERY_RAIDPLAYERS)).toBe(true);
    expect(checkRights("player", QUERY_RAIDS)).toBe(true);
    expect(checkRights("player", QUERY_SLOTS)).toBe(true);
    expect(checkRights("player", BROKEN_MUTATION)).toBe(false);
    expect(checkRights("player", MUTATION_BOSS)).toBe(false);
    expect(checkRights("player", MUTATION_BOSSITEM)).toBe(false);
    expect(checkRights("player", MUTATION_CLASS)).toBe(false);
    expect(checkRights("player", MUTATION_CLASSITEM)).toBe(false);
    expect(checkRights("player", MUTATION_DONJON)).toBe(false);
    expect(checkRights("player", MUTATION_ITEM)).toBe(false);
    expect(checkRights("player", MUTATION_LOOT)).toBe(false);
    expect(checkRights("player", MUTATION_MERIT)).toBe(false);
    expect(checkRights("player", MUTATION_PLAYER)).toBe(false);
    expect(checkRights("player", MUTATION_PLAYERMERIT)).toBe(false);
    expect(checkRights("player", MUTATION_PLAYERSLOT)).toBe(false);
    expect(checkRights("player", MUTATION_RAID)).toBe(false);
    expect(checkRights("player", MUTATION_RAIDPLAYER)).toBe(false);
    expect(checkRights("player", MUTATION_SLOT)).toBe(false);
    expect(checkRights("player", QUERY_MUTATION)).toBe(false);
    expect(checkRights("player", MULTIPLE_MUTATION)).toBe(false);
    expect(checkRights("player", MULTIPLE_SAME_MUTATION)).toBe(false);
  });
  it("should manage guest rights correctly", () => {
    expect(checkRights("guest", BROKEN_QUERY)).toBe(false);
    expect(checkRights("guest", QUERY_BOSSITEMS)).toBe(false);
    expect(checkRights("guest", QUERY_BOSSES)).toBe(false);
    expect(checkRights("guest", QUERY_CLASSITEMS)).toBe(false);
    expect(checkRights("guest", QUERY_CLASSES)).toBe(false);
    expect(checkRights("guest", QUERY_DONJONS)).toBe(false);
    expect(checkRights("guest", QUERY_ITEMS)).toBe(false);
    expect(checkRights("guest", QUERY_LOOTS)).toBe(false);
    expect(checkRights("guest", QUERY_MERITS)).toBe(false);
    expect(checkRights("guest", QUERY_PLAYERMERITS)).toBe(false);
    expect(checkRights("guest", QUERY_PLAYERSLOTS)).toBe(false);
    expect(checkRights("guest", QUERY_PLAYERS)).toBe(false);
    expect(checkRights("guest", QUERY_RAIDPLAYERS)).toBe(false);
    expect(checkRights("guest", QUERY_RAIDS)).toBe(false);
    expect(checkRights("guest", QUERY_SLOTS)).toBe(false);
    expect(checkRights("guest", BROKEN_MUTATION)).toBe(false);
    expect(checkRights("guest", MUTATION_BOSS)).toBe(false);
    expect(checkRights("guest", MUTATION_BOSSITEM)).toBe(false);
    expect(checkRights("guest", MUTATION_CLASS)).toBe(false);
    expect(checkRights("guest", MUTATION_CLASSITEM)).toBe(false);
    expect(checkRights("guest", MUTATION_DONJON)).toBe(false);
    expect(checkRights("guest", MUTATION_ITEM)).toBe(false);
    expect(checkRights("guest", MUTATION_LOOT)).toBe(false);
    expect(checkRights("guest", MUTATION_MERIT)).toBe(false);
    expect(checkRights("guest", MUTATION_PLAYER)).toBe(false);
    expect(checkRights("guest", MUTATION_PLAYERMERIT)).toBe(false);
    expect(checkRights("guest", MUTATION_PLAYERSLOT)).toBe(false);
    expect(checkRights("guest", MUTATION_RAID)).toBe(false);
    expect(checkRights("guest", MUTATION_RAIDPLAYER)).toBe(false);
    expect(checkRights("guest", MUTATION_SLOT)).toBe(false);
    expect(checkRights("guest", QUERY_MUTATION)).toBe(false);
    expect(checkRights("guest", MULTIPLE_MUTATION)).toBe(false);
    expect(checkRights("guest", MULTIPLE_SAME_MUTATION)).toBe(false);
  });
});
