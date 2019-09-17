export type Maybe<T> = T | null;
/** All built-in and custom scalars, mapped to their actual values */
export type Scalars = {
  ID: string;
  String: string;
  Boolean: boolean;
  Int: number;
  Float: number;
  /** A location in a connection that can be used for resuming pagination. */
  Cursor: any;
};

export type Boss = {
  __typename?: "Boss";
  id: Scalars["Int"];
  donjonId?: Maybe<Scalars["Int"]>;
  name?: Maybe<Scalars["String"]>;
  /** Reads a single `Donjon` that is related to this `Boss`. */
  donjonByDonjonId?: Maybe<Donjon>;
  /** Reads and enables pagination through a set of `BossItem`. */
  bossItemsByBossId: BossItemsConnection;
};

export type BossBossItemsByBossIdArgs = {
  first?: Maybe<Scalars["Int"]>;
  last?: Maybe<Scalars["Int"]>;
  offset?: Maybe<Scalars["Int"]>;
  before?: Maybe<Scalars["Cursor"]>;
  after?: Maybe<Scalars["Cursor"]>;
  orderBy?: Maybe<Array<BossItemsOrderBy>>;
  condition?: Maybe<BossItemCondition>;
};

/** A condition to be used against `Boss` object types. All fields are tested for equality and combined with a logical ‘and.’ */
export type BossCondition = {
  /** Checks for equality with the object’s `id` field. */
  id?: Maybe<Scalars["Int"]>;
  /** Checks for equality with the object’s `donjonId` field. */
  donjonId?: Maybe<Scalars["Int"]>;
  /** Checks for equality with the object’s `name` field. */
  name?: Maybe<Scalars["String"]>;
};

/** A connection to a list of `Boss` values. */
export type BossesConnection = {
  __typename?: "BossesConnection";
  /** A list of `Boss` objects. */
  nodes: Array<Maybe<Boss>>;
  /** A list of edges which contains the `Boss` and cursor to aid in pagination. */
  edges: Array<BossesEdge>;
  /** Information to aid in pagination. */
  pageInfo: PageInfo;
  /** The count of *all* `Boss` you could get from the connection. */
  totalCount: Scalars["Int"];
};

/** A `Boss` edge in the connection. */
export type BossesEdge = {
  __typename?: "BossesEdge";
  /** A cursor for use in pagination. */
  cursor?: Maybe<Scalars["Cursor"]>;
  /** The `Boss` at the end of the edge. */
  node?: Maybe<Boss>;
};

/** Methods to use when ordering `Boss`. */
export enum BossesOrderBy {
  Natural = "NATURAL",
  IdAsc = "ID_ASC",
  IdDesc = "ID_DESC",
  DonjonIdAsc = "DONJON_ID_ASC",
  DonjonIdDesc = "DONJON_ID_DESC",
  NameAsc = "NAME_ASC",
  NameDesc = "NAME_DESC"
}

export type BossItem = {
  __typename?: "BossItem";
  id: Scalars["Int"];
  itemId?: Maybe<Scalars["Int"]>;
  bossId?: Maybe<Scalars["Int"]>;
  /** Reads a single `Item` that is related to this `BossItem`. */
  itemByItemId?: Maybe<Item>;
  /** Reads a single `Boss` that is related to this `BossItem`. */
  bossByBossId?: Maybe<Boss>;
};

/**
 * A condition to be used against `BossItem` object types. All fields are tested
 * for equality and combined with a logical ‘and.’
 **/
export type BossItemCondition = {
  /** Checks for equality with the object’s `id` field. */
  id?: Maybe<Scalars["Int"]>;
  /** Checks for equality with the object’s `itemId` field. */
  itemId?: Maybe<Scalars["Int"]>;
  /** Checks for equality with the object’s `bossId` field. */
  bossId?: Maybe<Scalars["Int"]>;
};

/** A connection to a list of `BossItem` values. */
export type BossItemsConnection = {
  __typename?: "BossItemsConnection";
  /** A list of `BossItem` objects. */
  nodes: Array<Maybe<BossItem>>;
  /** A list of edges which contains the `BossItem` and cursor to aid in pagination. */
  edges: Array<BossItemsEdge>;
  /** Information to aid in pagination. */
  pageInfo: PageInfo;
  /** The count of *all* `BossItem` you could get from the connection. */
  totalCount: Scalars["Int"];
};

/** A `BossItem` edge in the connection. */
export type BossItemsEdge = {
  __typename?: "BossItemsEdge";
  /** A cursor for use in pagination. */
  cursor?: Maybe<Scalars["Cursor"]>;
  /** The `BossItem` at the end of the edge. */
  node?: Maybe<BossItem>;
};

/** Methods to use when ordering `BossItem`. */
export enum BossItemsOrderBy {
  Natural = "NATURAL",
  IdAsc = "ID_ASC",
  IdDesc = "ID_DESC",
  ItemIdAsc = "ITEM_ID_ASC",
  ItemIdDesc = "ITEM_ID_DESC",
  BossIdAsc = "BOSS_ID_ASC",
  BossIdDesc = "BOSS_ID_DESC"
}

export type Class = {
  __typename?: "Class";
  id: Scalars["Int"];
  color?: Maybe<Scalars["String"]>;
  name?: Maybe<Scalars["String"]>;
  /** Reads and enables pagination through a set of `Player`. */
  playersByClassId: PlayersConnection;
  /** Reads and enables pagination through a set of `Item`. */
  itemsByClassId: ItemsConnection;
  /** Reads and enables pagination through a set of `ClassItem`. */
  classItemsByClassId: ClassItemsConnection;
};

export type ClassPlayersByClassIdArgs = {
  first?: Maybe<Scalars["Int"]>;
  last?: Maybe<Scalars["Int"]>;
  offset?: Maybe<Scalars["Int"]>;
  before?: Maybe<Scalars["Cursor"]>;
  after?: Maybe<Scalars["Cursor"]>;
  orderBy?: Maybe<Array<PlayersOrderBy>>;
  condition?: Maybe<PlayerCondition>;
};

export type ClassItemsByClassIdArgs = {
  first?: Maybe<Scalars["Int"]>;
  last?: Maybe<Scalars["Int"]>;
  offset?: Maybe<Scalars["Int"]>;
  before?: Maybe<Scalars["Cursor"]>;
  after?: Maybe<Scalars["Cursor"]>;
  orderBy?: Maybe<Array<ItemsOrderBy>>;
  condition?: Maybe<ItemCondition>;
};

export type ClassClassItemsByClassIdArgs = {
  first?: Maybe<Scalars["Int"]>;
  last?: Maybe<Scalars["Int"]>;
  offset?: Maybe<Scalars["Int"]>;
  before?: Maybe<Scalars["Cursor"]>;
  after?: Maybe<Scalars["Cursor"]>;
  orderBy?: Maybe<Array<ClassItemsOrderBy>>;
  condition?: Maybe<ClassItemCondition>;
};

/** A condition to be used against `Class` object types. All fields are tested for equality and combined with a logical ‘and.’ */
export type ClassCondition = {
  /** Checks for equality with the object’s `id` field. */
  id?: Maybe<Scalars["Int"]>;
  /** Checks for equality with the object’s `color` field. */
  color?: Maybe<Scalars["String"]>;
  /** Checks for equality with the object’s `name` field. */
  name?: Maybe<Scalars["String"]>;
};

/** A connection to a list of `Class` values. */
export type ClassesConnection = {
  __typename?: "ClassesConnection";
  /** A list of `Class` objects. */
  nodes: Array<Maybe<Class>>;
  /** A list of edges which contains the `Class` and cursor to aid in pagination. */
  edges: Array<ClassesEdge>;
  /** Information to aid in pagination. */
  pageInfo: PageInfo;
  /** The count of *all* `Class` you could get from the connection. */
  totalCount: Scalars["Int"];
};

/** A `Class` edge in the connection. */
export type ClassesEdge = {
  __typename?: "ClassesEdge";
  /** A cursor for use in pagination. */
  cursor?: Maybe<Scalars["Cursor"]>;
  /** The `Class` at the end of the edge. */
  node?: Maybe<Class>;
};

/** Methods to use when ordering `Class`. */
export enum ClassesOrderBy {
  Natural = "NATURAL",
  IdAsc = "ID_ASC",
  IdDesc = "ID_DESC",
  ColorAsc = "COLOR_ASC",
  ColorDesc = "COLOR_DESC",
  NameAsc = "NAME_ASC",
  NameDesc = "NAME_DESC"
}

export type ClassItem = {
  __typename?: "ClassItem";
  id: Scalars["Int"];
  classId?: Maybe<Scalars["Int"]>;
  itemId?: Maybe<Scalars["Int"]>;
  itemValueForThisClass?: Maybe<Scalars["Int"]>;
  /** Reads a single `Class` that is related to this `ClassItem`. */
  classByClassId?: Maybe<Class>;
  /** Reads a single `Item` that is related to this `ClassItem`. */
  itemByItemId?: Maybe<Item>;
};

/**
 * A condition to be used against `ClassItem` object types. All fields are tested
 * for equality and combined with a logical ‘and.’
 **/
export type ClassItemCondition = {
  /** Checks for equality with the object’s `id` field. */
  id?: Maybe<Scalars["Int"]>;
  /** Checks for equality with the object’s `classId` field. */
  classId?: Maybe<Scalars["Int"]>;
  /** Checks for equality with the object’s `itemId` field. */
  itemId?: Maybe<Scalars["Int"]>;
  /** Checks for equality with the object’s `itemValueForThisClass` field. */
  itemValueForThisClass?: Maybe<Scalars["Int"]>;
};

/** An input for mutations affecting `ClassItem` */
export type ClassItemInput = {
  id?: Maybe<Scalars["Int"]>;
  classId?: Maybe<Scalars["Int"]>;
  itemId?: Maybe<Scalars["Int"]>;
  itemValueForThisClass?: Maybe<Scalars["Int"]>;
};

/** A connection to a list of `ClassItem` values. */
export type ClassItemsConnection = {
  __typename?: "ClassItemsConnection";
  /** A list of `ClassItem` objects. */
  nodes: Array<Maybe<ClassItem>>;
  /** A list of edges which contains the `ClassItem` and cursor to aid in pagination. */
  edges: Array<ClassItemsEdge>;
  /** Information to aid in pagination. */
  pageInfo: PageInfo;
  /** The count of *all* `ClassItem` you could get from the connection. */
  totalCount: Scalars["Int"];
};

/** A `ClassItem` edge in the connection. */
export type ClassItemsEdge = {
  __typename?: "ClassItemsEdge";
  /** A cursor for use in pagination. */
  cursor?: Maybe<Scalars["Cursor"]>;
  /** The `ClassItem` at the end of the edge. */
  node?: Maybe<ClassItem>;
};

/** Methods to use when ordering `ClassItem`. */
export enum ClassItemsOrderBy {
  Natural = "NATURAL",
  IdAsc = "ID_ASC",
  IdDesc = "ID_DESC",
  ClassIdAsc = "CLASS_ID_ASC",
  ClassIdDesc = "CLASS_ID_DESC",
  ItemIdAsc = "ITEM_ID_ASC",
  ItemIdDesc = "ITEM_ID_DESC",
  ItemValueForThisClassAsc = "ITEM_VALUE_FOR_THIS_CLASS_ASC",
  ItemValueForThisClassDesc = "ITEM_VALUE_FOR_THIS_CLASS_DESC"
}

/** All input for the create `ClassItem` mutation. */
export type CreateClassItemInput = {
  /**
   * An arbitrary string value with no semantic meaning. Will be included in the
   * payload verbatim. May be used to track mutations by the client.
   **/
  clientMutationId?: Maybe<Scalars["String"]>;
  /** The `ClassItem` to be created by this mutation. */
  classItem: ClassItemInput;
};

/** The output of our create `ClassItem` mutation. */
export type CreateClassItemPayload = {
  __typename?: "CreateClassItemPayload";
  /**
   * The exact same `clientMutationId` that was provided in the mutation input,
   * unchanged and unused. May be used by a client to track mutations.
   **/
  clientMutationId?: Maybe<Scalars["String"]>;
  /** The `ClassItem` that was created by this mutation. */
  classItem?: Maybe<ClassItem>;
  /** Our root query field type. Allows us to run any query from our mutation payload. */
  query?: Maybe<Query>;
  /** Reads a single `Class` that is related to this `ClassItem`. */
  classByClassId?: Maybe<Class>;
  /** Reads a single `Item` that is related to this `ClassItem`. */
  itemByItemId?: Maybe<Item>;
  /** An edge for our `ClassItem`. May be used by Relay 1. */
  classItemEdge?: Maybe<ClassItemsEdge>;
};

/** The output of our create `ClassItem` mutation. */
export type CreateClassItemPayloadClassItemEdgeArgs = {
  orderBy?: Maybe<Array<ClassItemsOrderBy>>;
};

/** All input for the create `Loot` mutation. */
export type CreateLootInput = {
  /**
   * An arbitrary string value with no semantic meaning. Will be included in the
   * payload verbatim. May be used to track mutations by the client.
   **/
  clientMutationId?: Maybe<Scalars["String"]>;
  /** The `Loot` to be created by this mutation. */
  loot: LootInput;
};

/** The output of our create `Loot` mutation. */
export type CreateLootPayload = {
  __typename?: "CreateLootPayload";
  /**
   * The exact same `clientMutationId` that was provided in the mutation input,
   * unchanged and unused. May be used by a client to track mutations.
   **/
  clientMutationId?: Maybe<Scalars["String"]>;
  /** The `Loot` that was created by this mutation. */
  loot?: Maybe<Loot>;
  /** Our root query field type. Allows us to run any query from our mutation payload. */
  query?: Maybe<Query>;
  /** Reads a single `Player` that is related to this `Loot`. */
  playerByPlayerId?: Maybe<Player>;
  /** Reads a single `Item` that is related to this `Loot`. */
  itemByItemId?: Maybe<Item>;
  /** Reads a single `Raid` that is related to this `Loot`. */
  raidByRaidId?: Maybe<Raid>;
  /** An edge for our `Loot`. May be used by Relay 1. */
  lootEdge?: Maybe<LootsEdge>;
};

/** The output of our create `Loot` mutation. */
export type CreateLootPayloadLootEdgeArgs = {
  orderBy?: Maybe<Array<LootsOrderBy>>;
};

/** All input for the create `PlayerMerit` mutation. */
export type CreatePlayerMeritInput = {
  /**
   * An arbitrary string value with no semantic meaning. Will be included in the
   * payload verbatim. May be used to track mutations by the client.
   **/
  clientMutationId?: Maybe<Scalars["String"]>;
  /** The `PlayerMerit` to be created by this mutation. */
  playerMerit: PlayerMeritInput;
};

/** The output of our create `PlayerMerit` mutation. */
export type CreatePlayerMeritPayload = {
  __typename?: "CreatePlayerMeritPayload";
  /**
   * The exact same `clientMutationId` that was provided in the mutation input,
   * unchanged and unused. May be used by a client to track mutations.
   **/
  clientMutationId?: Maybe<Scalars["String"]>;
  /** The `PlayerMerit` that was created by this mutation. */
  playerMerit?: Maybe<PlayerMerit>;
  /** Our root query field type. Allows us to run any query from our mutation payload. */
  query?: Maybe<Query>;
  /** Reads a single `Merit` that is related to this `PlayerMerit`. */
  meritByMeritId?: Maybe<Merit>;
  /** Reads a single `Player` that is related to this `PlayerMerit`. */
  playerByPlayerId?: Maybe<Player>;
  /** An edge for our `PlayerMerit`. May be used by Relay 1. */
  playerMeritEdge?: Maybe<PlayerMeritsEdge>;
};

/** The output of our create `PlayerMerit` mutation. */
export type CreatePlayerMeritPayloadPlayerMeritEdgeArgs = {
  orderBy?: Maybe<Array<PlayerMeritsOrderBy>>;
};

/** All input for the create `PlayerSlot` mutation. */
export type CreatePlayerSlotInput = {
  /**
   * An arbitrary string value with no semantic meaning. Will be included in the
   * payload verbatim. May be used to track mutations by the client.
   **/
  clientMutationId?: Maybe<Scalars["String"]>;
  /** The `PlayerSlot` to be created by this mutation. */
  playerSlot: PlayerSlotInput;
};

/** The output of our create `PlayerSlot` mutation. */
export type CreatePlayerSlotPayload = {
  __typename?: "CreatePlayerSlotPayload";
  /**
   * The exact same `clientMutationId` that was provided in the mutation input,
   * unchanged and unused. May be used by a client to track mutations.
   **/
  clientMutationId?: Maybe<Scalars["String"]>;
  /** The `PlayerSlot` that was created by this mutation. */
  playerSlot?: Maybe<PlayerSlot>;
  /** Our root query field type. Allows us to run any query from our mutation payload. */
  query?: Maybe<Query>;
  /** Reads a single `Player` that is related to this `PlayerSlot`. */
  playerByPlayerId?: Maybe<Player>;
  /** Reads a single `Slot` that is related to this `PlayerSlot`. */
  slotBySlotId?: Maybe<Slot>;
  /** An edge for our `PlayerSlot`. May be used by Relay 1. */
  playerSlotEdge?: Maybe<PlayerSlotsEdge>;
};

/** The output of our create `PlayerSlot` mutation. */
export type CreatePlayerSlotPayloadPlayerSlotEdgeArgs = {
  orderBy?: Maybe<Array<PlayerSlotsOrderBy>>;
};

/** All input for the create `RaidPlayer` mutation. */
export type CreateRaidPlayerInput = {
  /**
   * An arbitrary string value with no semantic meaning. Will be included in the
   * payload verbatim. May be used to track mutations by the client.
   **/
  clientMutationId?: Maybe<Scalars["String"]>;
  /** The `RaidPlayer` to be created by this mutation. */
  raidPlayer: RaidPlayerInput;
};

/** The output of our create `RaidPlayer` mutation. */
export type CreateRaidPlayerPayload = {
  __typename?: "CreateRaidPlayerPayload";
  /**
   * The exact same `clientMutationId` that was provided in the mutation input,
   * unchanged and unused. May be used by a client to track mutations.
   **/
  clientMutationId?: Maybe<Scalars["String"]>;
  /** The `RaidPlayer` that was created by this mutation. */
  raidPlayer?: Maybe<RaidPlayer>;
  /** Our root query field type. Allows us to run any query from our mutation payload. */
  query?: Maybe<Query>;
  /** Reads a single `Player` that is related to this `RaidPlayer`. */
  playerByPlayerId?: Maybe<Player>;
  /** Reads a single `Raid` that is related to this `RaidPlayer`. */
  raidByRaidId?: Maybe<Raid>;
  /** An edge for our `RaidPlayer`. May be used by Relay 1. */
  raidPlayerEdge?: Maybe<RaidPlayersEdge>;
};

/** The output of our create `RaidPlayer` mutation. */
export type CreateRaidPlayerPayloadRaidPlayerEdgeArgs = {
  orderBy?: Maybe<Array<RaidPlayersOrderBy>>;
};

export type Donjon = {
  __typename?: "Donjon";
  id: Scalars["Int"];
  name?: Maybe<Scalars["String"]>;
  shortName?: Maybe<Scalars["String"]>;
  active?: Maybe<Scalars["Boolean"]>;
  /** Reads and enables pagination through a set of `Boss`. */
  bossesByDonjonId: BossesConnection;
  /** Reads and enables pagination through a set of `Raid`. */
  raidsByDonjonId: RaidsConnection;
};

export type DonjonBossesByDonjonIdArgs = {
  first?: Maybe<Scalars["Int"]>;
  last?: Maybe<Scalars["Int"]>;
  offset?: Maybe<Scalars["Int"]>;
  before?: Maybe<Scalars["Cursor"]>;
  after?: Maybe<Scalars["Cursor"]>;
  orderBy?: Maybe<Array<BossesOrderBy>>;
  condition?: Maybe<BossCondition>;
};

export type DonjonRaidsByDonjonIdArgs = {
  first?: Maybe<Scalars["Int"]>;
  last?: Maybe<Scalars["Int"]>;
  offset?: Maybe<Scalars["Int"]>;
  before?: Maybe<Scalars["Cursor"]>;
  after?: Maybe<Scalars["Cursor"]>;
  orderBy?: Maybe<Array<RaidsOrderBy>>;
  condition?: Maybe<RaidCondition>;
};

/** A condition to be used against `Donjon` object types. All fields are tested for equality and combined with a logical ‘and.’ */
export type DonjonCondition = {
  /** Checks for equality with the object’s `id` field. */
  id?: Maybe<Scalars["Int"]>;
  /** Checks for equality with the object’s `name` field. */
  name?: Maybe<Scalars["String"]>;
  /** Checks for equality with the object’s `shortName` field. */
  shortName?: Maybe<Scalars["String"]>;
  /** Checks for equality with the object’s `active` field. */
  active?: Maybe<Scalars["Boolean"]>;
};

/** A connection to a list of `Donjon` values. */
export type DonjonsConnection = {
  __typename?: "DonjonsConnection";
  /** A list of `Donjon` objects. */
  nodes: Array<Maybe<Donjon>>;
  /** A list of edges which contains the `Donjon` and cursor to aid in pagination. */
  edges: Array<DonjonsEdge>;
  /** Information to aid in pagination. */
  pageInfo: PageInfo;
  /** The count of *all* `Donjon` you could get from the connection. */
  totalCount: Scalars["Int"];
};

/** A `Donjon` edge in the connection. */
export type DonjonsEdge = {
  __typename?: "DonjonsEdge";
  /** A cursor for use in pagination. */
  cursor?: Maybe<Scalars["Cursor"]>;
  /** The `Donjon` at the end of the edge. */
  node?: Maybe<Donjon>;
};

/** Methods to use when ordering `Donjon`. */
export enum DonjonsOrderBy {
  Natural = "NATURAL",
  IdAsc = "ID_ASC",
  IdDesc = "ID_DESC",
  NameAsc = "NAME_ASC",
  NameDesc = "NAME_DESC",
  ShortNameAsc = "SHORT_NAME_ASC",
  ShortNameDesc = "SHORT_NAME_DESC",
  ActiveAsc = "ACTIVE_ASC",
  ActiveDesc = "ACTIVE_DESC"
}

export type Item = {
  __typename?: "Item";
  id: Scalars["Int"];
  name?: Maybe<Scalars["String"]>;
  wowheadId?: Maybe<Scalars["Int"]>;
  classId?: Maybe<Scalars["Int"]>;
  /** Reads a single `Class` that is related to this `Item`. */
  classByClassId?: Maybe<Class>;
  /** Reads and enables pagination through a set of `Loot`. */
  lootsByItemId: LootsConnection;
  /** Reads and enables pagination through a set of `ClassItem`. */
  classItemsByItemId: ClassItemsConnection;
  /** Reads and enables pagination through a set of `BossItem`. */
  bossItemsByItemId: BossItemsConnection;
};

export type ItemLootsByItemIdArgs = {
  first?: Maybe<Scalars["Int"]>;
  last?: Maybe<Scalars["Int"]>;
  offset?: Maybe<Scalars["Int"]>;
  before?: Maybe<Scalars["Cursor"]>;
  after?: Maybe<Scalars["Cursor"]>;
  orderBy?: Maybe<Array<LootsOrderBy>>;
  condition?: Maybe<LootCondition>;
};

export type ItemClassItemsByItemIdArgs = {
  first?: Maybe<Scalars["Int"]>;
  last?: Maybe<Scalars["Int"]>;
  offset?: Maybe<Scalars["Int"]>;
  before?: Maybe<Scalars["Cursor"]>;
  after?: Maybe<Scalars["Cursor"]>;
  orderBy?: Maybe<Array<ClassItemsOrderBy>>;
  condition?: Maybe<ClassItemCondition>;
};

export type ItemBossItemsByItemIdArgs = {
  first?: Maybe<Scalars["Int"]>;
  last?: Maybe<Scalars["Int"]>;
  offset?: Maybe<Scalars["Int"]>;
  before?: Maybe<Scalars["Cursor"]>;
  after?: Maybe<Scalars["Cursor"]>;
  orderBy?: Maybe<Array<BossItemsOrderBy>>;
  condition?: Maybe<BossItemCondition>;
};

/** A condition to be used against `Item` object types. All fields are tested for equality and combined with a logical ‘and.’ */
export type ItemCondition = {
  /** Checks for equality with the object’s `id` field. */
  id?: Maybe<Scalars["Int"]>;
  /** Checks for equality with the object’s `name` field. */
  name?: Maybe<Scalars["String"]>;
  /** Checks for equality with the object’s `wowheadId` field. */
  wowheadId?: Maybe<Scalars["Int"]>;
  /** Checks for equality with the object’s `classId` field. */
  classId?: Maybe<Scalars["Int"]>;
};

/** A connection to a list of `Item` values. */
export type ItemsConnection = {
  __typename?: "ItemsConnection";
  /** A list of `Item` objects. */
  nodes: Array<Maybe<Item>>;
  /** A list of edges which contains the `Item` and cursor to aid in pagination. */
  edges: Array<ItemsEdge>;
  /** Information to aid in pagination. */
  pageInfo: PageInfo;
  /** The count of *all* `Item` you could get from the connection. */
  totalCount: Scalars["Int"];
};

/** A `Item` edge in the connection. */
export type ItemsEdge = {
  __typename?: "ItemsEdge";
  /** A cursor for use in pagination. */
  cursor?: Maybe<Scalars["Cursor"]>;
  /** The `Item` at the end of the edge. */
  node?: Maybe<Item>;
};

/** Methods to use when ordering `Item`. */
export enum ItemsOrderBy {
  Natural = "NATURAL",
  IdAsc = "ID_ASC",
  IdDesc = "ID_DESC",
  NameAsc = "NAME_ASC",
  NameDesc = "NAME_DESC",
  WowheadIdAsc = "WOWHEAD_ID_ASC",
  WowheadIdDesc = "WOWHEAD_ID_DESC",
  ClassIdAsc = "CLASS_ID_ASC",
  ClassIdDesc = "CLASS_ID_DESC"
}

export type Loot = {
  __typename?: "Loot";
  id: Scalars["Int"];
  playerId?: Maybe<Scalars["Int"]>;
  itemId?: Maybe<Scalars["Int"]>;
  raidId?: Maybe<Scalars["Int"]>;
  active?: Maybe<Scalars["Boolean"]>;
  /** Reads a single `Player` that is related to this `Loot`. */
  playerByPlayerId?: Maybe<Player>;
  /** Reads a single `Item` that is related to this `Loot`. */
  itemByItemId?: Maybe<Item>;
  /** Reads a single `Raid` that is related to this `Loot`. */
  raidByRaidId?: Maybe<Raid>;
};

/** A condition to be used against `Loot` object types. All fields are tested for equality and combined with a logical ‘and.’ */
export type LootCondition = {
  /** Checks for equality with the object’s `id` field. */
  id?: Maybe<Scalars["Int"]>;
  /** Checks for equality with the object’s `playerId` field. */
  playerId?: Maybe<Scalars["Int"]>;
  /** Checks for equality with the object’s `itemId` field. */
  itemId?: Maybe<Scalars["Int"]>;
  /** Checks for equality with the object’s `raidId` field. */
  raidId?: Maybe<Scalars["Int"]>;
  /** Checks for equality with the object’s `active` field. */
  active?: Maybe<Scalars["Boolean"]>;
};

/** An input for mutations affecting `Loot` */
export type LootInput = {
  id?: Maybe<Scalars["Int"]>;
  playerId?: Maybe<Scalars["Int"]>;
  itemId?: Maybe<Scalars["Int"]>;
  raidId?: Maybe<Scalars["Int"]>;
  active?: Maybe<Scalars["Boolean"]>;
};

/** A connection to a list of `Loot` values. */
export type LootsConnection = {
  __typename?: "LootsConnection";
  /** A list of `Loot` objects. */
  nodes: Array<Maybe<Loot>>;
  /** A list of edges which contains the `Loot` and cursor to aid in pagination. */
  edges: Array<LootsEdge>;
  /** Information to aid in pagination. */
  pageInfo: PageInfo;
  /** The count of *all* `Loot` you could get from the connection. */
  totalCount: Scalars["Int"];
};

/** A `Loot` edge in the connection. */
export type LootsEdge = {
  __typename?: "LootsEdge";
  /** A cursor for use in pagination. */
  cursor?: Maybe<Scalars["Cursor"]>;
  /** The `Loot` at the end of the edge. */
  node?: Maybe<Loot>;
};

/** Methods to use when ordering `Loot`. */
export enum LootsOrderBy {
  Natural = "NATURAL",
  IdAsc = "ID_ASC",
  IdDesc = "ID_DESC",
  PlayerIdAsc = "PLAYER_ID_ASC",
  PlayerIdDesc = "PLAYER_ID_DESC",
  ItemIdAsc = "ITEM_ID_ASC",
  ItemIdDesc = "ITEM_ID_DESC",
  RaidIdAsc = "RAID_ID_ASC",
  RaidIdDesc = "RAID_ID_DESC",
  ActiveAsc = "ACTIVE_ASC",
  ActiveDesc = "ACTIVE_DESC"
}

export type Merit = {
  __typename?: "Merit";
  id: Scalars["Int"];
  categorie?: Maybe<Scalars["String"]>;
  name?: Maybe<Scalars["String"]>;
  comment?: Maybe<Scalars["String"]>;
  value?: Maybe<Scalars["Int"]>;
  active?: Maybe<Scalars["Boolean"]>;
  /** Reads and enables pagination through a set of `PlayerMerit`. */
  playerMeritsByMeritId: PlayerMeritsConnection;
};

export type MeritPlayerMeritsByMeritIdArgs = {
  first?: Maybe<Scalars["Int"]>;
  last?: Maybe<Scalars["Int"]>;
  offset?: Maybe<Scalars["Int"]>;
  before?: Maybe<Scalars["Cursor"]>;
  after?: Maybe<Scalars["Cursor"]>;
  orderBy?: Maybe<Array<PlayerMeritsOrderBy>>;
  condition?: Maybe<PlayerMeritCondition>;
};

/** A condition to be used against `Merit` object types. All fields are tested for equality and combined with a logical ‘and.’ */
export type MeritCondition = {
  /** Checks for equality with the object’s `id` field. */
  id?: Maybe<Scalars["Int"]>;
  /** Checks for equality with the object’s `categorie` field. */
  categorie?: Maybe<Scalars["String"]>;
  /** Checks for equality with the object’s `name` field. */
  name?: Maybe<Scalars["String"]>;
  /** Checks for equality with the object’s `comment` field. */
  comment?: Maybe<Scalars["String"]>;
  /** Checks for equality with the object’s `value` field. */
  value?: Maybe<Scalars["Int"]>;
  /** Checks for equality with the object’s `active` field. */
  active?: Maybe<Scalars["Boolean"]>;
};

/** A connection to a list of `Merit` values. */
export type MeritsConnection = {
  __typename?: "MeritsConnection";
  /** A list of `Merit` objects. */
  nodes: Array<Maybe<Merit>>;
  /** A list of edges which contains the `Merit` and cursor to aid in pagination. */
  edges: Array<MeritsEdge>;
  /** Information to aid in pagination. */
  pageInfo: PageInfo;
  /** The count of *all* `Merit` you could get from the connection. */
  totalCount: Scalars["Int"];
};

/** A `Merit` edge in the connection. */
export type MeritsEdge = {
  __typename?: "MeritsEdge";
  /** A cursor for use in pagination. */
  cursor?: Maybe<Scalars["Cursor"]>;
  /** The `Merit` at the end of the edge. */
  node?: Maybe<Merit>;
};

/** Methods to use when ordering `Merit`. */
export enum MeritsOrderBy {
  Natural = "NATURAL",
  IdAsc = "ID_ASC",
  IdDesc = "ID_DESC",
  CategorieAsc = "CATEGORIE_ASC",
  CategorieDesc = "CATEGORIE_DESC",
  NameAsc = "NAME_ASC",
  NameDesc = "NAME_DESC",
  CommentAsc = "COMMENT_ASC",
  CommentDesc = "COMMENT_DESC",
  ValueAsc = "VALUE_ASC",
  ValueDesc = "VALUE_DESC",
  ActiveAsc = "ACTIVE_ASC",
  ActiveDesc = "ACTIVE_DESC"
}

/** The root mutation type which contains root level fields which mutate data. */
export type Mutation = {
  __typename?: "Mutation";
  /** Creates a single `ClassItem`. */
  createClassItem?: Maybe<CreateClassItemPayload>;
  /** Creates a single `Loot`. */
  createLoot?: Maybe<CreateLootPayload>;
  /** Creates a single `PlayerMerit`. */
  createPlayerMerit?: Maybe<CreatePlayerMeritPayload>;
  /** Creates a single `PlayerSlot`. */
  createPlayerSlot?: Maybe<CreatePlayerSlotPayload>;
  /** Creates a single `RaidPlayer`. */
  createRaidPlayer?: Maybe<CreateRaidPlayerPayload>;
};

/** The root mutation type which contains root level fields which mutate data. */
export type MutationCreateClassItemArgs = {
  input: CreateClassItemInput;
};

/** The root mutation type which contains root level fields which mutate data. */
export type MutationCreateLootArgs = {
  input: CreateLootInput;
};

/** The root mutation type which contains root level fields which mutate data. */
export type MutationCreatePlayerMeritArgs = {
  input: CreatePlayerMeritInput;
};

/** The root mutation type which contains root level fields which mutate data. */
export type MutationCreatePlayerSlotArgs = {
  input: CreatePlayerSlotInput;
};

/** The root mutation type which contains root level fields which mutate data. */
export type MutationCreateRaidPlayerArgs = {
  input: CreateRaidPlayerInput;
};

/** An object with a globally unique `ID`. */
export type Node = {
  /** A globally unique identifier. Can be used in various places throughout the system to identify this single value. */
  nodeId: Scalars["ID"];
};

/** Information about pagination in a connection. */
export type PageInfo = {
  __typename?: "PageInfo";
  /** When paginating forwards, are there more items? */
  hasNextPage: Scalars["Boolean"];
  /** When paginating backwards, are there more items? */
  hasPreviousPage: Scalars["Boolean"];
  /** When paginating backwards, the cursor to continue. */
  startCursor?: Maybe<Scalars["Cursor"]>;
  /** When paginating forwards, the cursor to continue. */
  endCursor?: Maybe<Scalars["Cursor"]>;
};

export type Player = {
  __typename?: "Player";
  id: Scalars["Int"];
  name?: Maybe<Scalars["String"]>;
  classId?: Maybe<Scalars["Int"]>;
  rank?: Maybe<Scalars["String"]>;
  active?: Maybe<Scalars["Boolean"]>;
  /** Reads a single `Class` that is related to this `Player`. */
  classByClassId?: Maybe<Class>;
  /** Reads and enables pagination through a set of `PlayerSlot`. */
  playerSlotsByPlayerId: PlayerSlotsConnection;
  /** Reads and enables pagination through a set of `PlayerMerit`. */
  playerMeritsByPlayerId: PlayerMeritsConnection;
  /** Reads and enables pagination through a set of `Loot`. */
  lootsByPlayerId: LootsConnection;
  /** Reads and enables pagination through a set of `RaidPlayer`. */
  raidPlayersByPlayerId: RaidPlayersConnection;
};

export type PlayerPlayerSlotsByPlayerIdArgs = {
  first?: Maybe<Scalars["Int"]>;
  last?: Maybe<Scalars["Int"]>;
  offset?: Maybe<Scalars["Int"]>;
  before?: Maybe<Scalars["Cursor"]>;
  after?: Maybe<Scalars["Cursor"]>;
  orderBy?: Maybe<Array<PlayerSlotsOrderBy>>;
  condition?: Maybe<PlayerSlotCondition>;
};

export type PlayerPlayerMeritsByPlayerIdArgs = {
  first?: Maybe<Scalars["Int"]>;
  last?: Maybe<Scalars["Int"]>;
  offset?: Maybe<Scalars["Int"]>;
  before?: Maybe<Scalars["Cursor"]>;
  after?: Maybe<Scalars["Cursor"]>;
  orderBy?: Maybe<Array<PlayerMeritsOrderBy>>;
  condition?: Maybe<PlayerMeritCondition>;
};

export type PlayerLootsByPlayerIdArgs = {
  first?: Maybe<Scalars["Int"]>;
  last?: Maybe<Scalars["Int"]>;
  offset?: Maybe<Scalars["Int"]>;
  before?: Maybe<Scalars["Cursor"]>;
  after?: Maybe<Scalars["Cursor"]>;
  orderBy?: Maybe<Array<LootsOrderBy>>;
  condition?: Maybe<LootCondition>;
};

export type PlayerRaidPlayersByPlayerIdArgs = {
  first?: Maybe<Scalars["Int"]>;
  last?: Maybe<Scalars["Int"]>;
  offset?: Maybe<Scalars["Int"]>;
  before?: Maybe<Scalars["Cursor"]>;
  after?: Maybe<Scalars["Cursor"]>;
  orderBy?: Maybe<Array<RaidPlayersOrderBy>>;
  condition?: Maybe<RaidPlayerCondition>;
};

/** A condition to be used against `Player` object types. All fields are tested for equality and combined with a logical ‘and.’ */
export type PlayerCondition = {
  /** Checks for equality with the object’s `id` field. */
  id?: Maybe<Scalars["Int"]>;
  /** Checks for equality with the object’s `name` field. */
  name?: Maybe<Scalars["String"]>;
  /** Checks for equality with the object’s `classId` field. */
  classId?: Maybe<Scalars["Int"]>;
  /** Checks for equality with the object’s `rank` field. */
  rank?: Maybe<Scalars["String"]>;
  /** Checks for equality with the object’s `active` field. */
  active?: Maybe<Scalars["Boolean"]>;
};

export type PlayerMerit = {
  __typename?: "PlayerMerit";
  id: Scalars["Int"];
  meritId?: Maybe<Scalars["Int"]>;
  playerId?: Maybe<Scalars["Int"]>;
  date?: Maybe<Scalars["String"]>;
  active?: Maybe<Scalars["Boolean"]>;
  /** Reads a single `Merit` that is related to this `PlayerMerit`. */
  meritByMeritId?: Maybe<Merit>;
  /** Reads a single `Player` that is related to this `PlayerMerit`. */
  playerByPlayerId?: Maybe<Player>;
};

/**
 * A condition to be used against `PlayerMerit` object types. All fields are tested
 * for equality and combined with a logical ‘and.’
 **/
export type PlayerMeritCondition = {
  /** Checks for equality with the object’s `id` field. */
  id?: Maybe<Scalars["Int"]>;
  /** Checks for equality with the object’s `meritId` field. */
  meritId?: Maybe<Scalars["Int"]>;
  /** Checks for equality with the object’s `playerId` field. */
  playerId?: Maybe<Scalars["Int"]>;
  /** Checks for equality with the object’s `date` field. */
  date?: Maybe<Scalars["String"]>;
  /** Checks for equality with the object’s `active` field. */
  active?: Maybe<Scalars["Boolean"]>;
};

/** An input for mutations affecting `PlayerMerit` */
export type PlayerMeritInput = {
  id?: Maybe<Scalars["Int"]>;
  meritId?: Maybe<Scalars["Int"]>;
  playerId?: Maybe<Scalars["Int"]>;
  date?: Maybe<Scalars["String"]>;
  active?: Maybe<Scalars["Boolean"]>;
};

/** A connection to a list of `PlayerMerit` values. */
export type PlayerMeritsConnection = {
  __typename?: "PlayerMeritsConnection";
  /** A list of `PlayerMerit` objects. */
  nodes: Array<Maybe<PlayerMerit>>;
  /** A list of edges which contains the `PlayerMerit` and cursor to aid in pagination. */
  edges: Array<PlayerMeritsEdge>;
  /** Information to aid in pagination. */
  pageInfo: PageInfo;
  /** The count of *all* `PlayerMerit` you could get from the connection. */
  totalCount: Scalars["Int"];
};

/** A `PlayerMerit` edge in the connection. */
export type PlayerMeritsEdge = {
  __typename?: "PlayerMeritsEdge";
  /** A cursor for use in pagination. */
  cursor?: Maybe<Scalars["Cursor"]>;
  /** The `PlayerMerit` at the end of the edge. */
  node?: Maybe<PlayerMerit>;
};

/** Methods to use when ordering `PlayerMerit`. */
export enum PlayerMeritsOrderBy {
  Natural = "NATURAL",
  IdAsc = "ID_ASC",
  IdDesc = "ID_DESC",
  MeritIdAsc = "MERIT_ID_ASC",
  MeritIdDesc = "MERIT_ID_DESC",
  PlayerIdAsc = "PLAYER_ID_ASC",
  PlayerIdDesc = "PLAYER_ID_DESC",
  DateAsc = "DATE_ASC",
  DateDesc = "DATE_DESC",
  ActiveAsc = "ACTIVE_ASC",
  ActiveDesc = "ACTIVE_DESC"
}

/** A connection to a list of `Player` values. */
export type PlayersConnection = {
  __typename?: "PlayersConnection";
  /** A list of `Player` objects. */
  nodes: Array<Maybe<Player>>;
  /** A list of edges which contains the `Player` and cursor to aid in pagination. */
  edges: Array<PlayersEdge>;
  /** Information to aid in pagination. */
  pageInfo: PageInfo;
  /** The count of *all* `Player` you could get from the connection. */
  totalCount: Scalars["Int"];
};

/** A `Player` edge in the connection. */
export type PlayersEdge = {
  __typename?: "PlayersEdge";
  /** A cursor for use in pagination. */
  cursor?: Maybe<Scalars["Cursor"]>;
  /** The `Player` at the end of the edge. */
  node?: Maybe<Player>;
};

export type PlayerSlot = {
  __typename?: "PlayerSlot";
  id: Scalars["Int"];
  playerId?: Maybe<Scalars["Int"]>;
  slotId?: Maybe<Scalars["Int"]>;
  enchanted?: Maybe<Scalars["Boolean"]>;
  scoreMerit?: Maybe<Scalars["Int"]>;
  validated?: Maybe<Scalars["Boolean"]>;
  /** Reads a single `Player` that is related to this `PlayerSlot`. */
  playerByPlayerId?: Maybe<Player>;
  /** Reads a single `Slot` that is related to this `PlayerSlot`. */
  slotBySlotId?: Maybe<Slot>;
};

/**
 * A condition to be used against `PlayerSlot` object types. All fields are tested
 * for equality and combined with a logical ‘and.’
 **/
export type PlayerSlotCondition = {
  /** Checks for equality with the object’s `id` field. */
  id?: Maybe<Scalars["Int"]>;
  /** Checks for equality with the object’s `playerId` field. */
  playerId?: Maybe<Scalars["Int"]>;
  /** Checks for equality with the object’s `slotId` field. */
  slotId?: Maybe<Scalars["Int"]>;
  /** Checks for equality with the object’s `enchanted` field. */
  enchanted?: Maybe<Scalars["Boolean"]>;
  /** Checks for equality with the object’s `scoreMerit` field. */
  scoreMerit?: Maybe<Scalars["Int"]>;
  /** Checks for equality with the object’s `validated` field. */
  validated?: Maybe<Scalars["Boolean"]>;
};

/** An input for mutations affecting `PlayerSlot` */
export type PlayerSlotInput = {
  id?: Maybe<Scalars["Int"]>;
  playerId?: Maybe<Scalars["Int"]>;
  slotId?: Maybe<Scalars["Int"]>;
  enchanted?: Maybe<Scalars["Boolean"]>;
  scoreMerit?: Maybe<Scalars["Int"]>;
  validated?: Maybe<Scalars["Boolean"]>;
};

/** A connection to a list of `PlayerSlot` values. */
export type PlayerSlotsConnection = {
  __typename?: "PlayerSlotsConnection";
  /** A list of `PlayerSlot` objects. */
  nodes: Array<Maybe<PlayerSlot>>;
  /** A list of edges which contains the `PlayerSlot` and cursor to aid in pagination. */
  edges: Array<PlayerSlotsEdge>;
  /** Information to aid in pagination. */
  pageInfo: PageInfo;
  /** The count of *all* `PlayerSlot` you could get from the connection. */
  totalCount: Scalars["Int"];
};

/** A `PlayerSlot` edge in the connection. */
export type PlayerSlotsEdge = {
  __typename?: "PlayerSlotsEdge";
  /** A cursor for use in pagination. */
  cursor?: Maybe<Scalars["Cursor"]>;
  /** The `PlayerSlot` at the end of the edge. */
  node?: Maybe<PlayerSlot>;
};

/** Methods to use when ordering `PlayerSlot`. */
export enum PlayerSlotsOrderBy {
  Natural = "NATURAL",
  IdAsc = "ID_ASC",
  IdDesc = "ID_DESC",
  PlayerIdAsc = "PLAYER_ID_ASC",
  PlayerIdDesc = "PLAYER_ID_DESC",
  SlotIdAsc = "SLOT_ID_ASC",
  SlotIdDesc = "SLOT_ID_DESC",
  EnchantedAsc = "ENCHANTED_ASC",
  EnchantedDesc = "ENCHANTED_DESC",
  ScoreMeritAsc = "SCORE_MERIT_ASC",
  ScoreMeritDesc = "SCORE_MERIT_DESC",
  ValidatedAsc = "VALIDATED_ASC",
  ValidatedDesc = "VALIDATED_DESC"
}

/** Methods to use when ordering `Player`. */
export enum PlayersOrderBy {
  Natural = "NATURAL",
  IdAsc = "ID_ASC",
  IdDesc = "ID_DESC",
  NameAsc = "NAME_ASC",
  NameDesc = "NAME_DESC",
  ClassIdAsc = "CLASS_ID_ASC",
  ClassIdDesc = "CLASS_ID_DESC",
  RankAsc = "RANK_ASC",
  RankDesc = "RANK_DESC",
  ActiveAsc = "ACTIVE_ASC",
  ActiveDesc = "ACTIVE_DESC"
}

/** The root query type which gives access points into the data universe. */
export type Query = Node & {
  __typename?: "Query";
  /**
   * Exposes the root query type nested one level down. This is helpful for Relay 1
   * which can only query top level fields if they are in a particular form.
   **/
  query: Query;
  /** The root query type must be a `Node` to work well with Relay 1 mutations. This just resolves to `query`. */
  nodeId: Scalars["ID"];
  /** Fetches an object given its globally unique `ID`. */
  node?: Maybe<Node>;
  /** Reads and enables pagination through a set of `BossItem`. */
  allBossItems?: Maybe<BossItemsConnection>;
  /** Reads and enables pagination through a set of `Boss`. */
  allBosses?: Maybe<BossesConnection>;
  /** Reads and enables pagination through a set of `ClassItem`. */
  allClassItems?: Maybe<ClassItemsConnection>;
  /** Reads and enables pagination through a set of `Class`. */
  allClasses?: Maybe<ClassesConnection>;
  /** Reads and enables pagination through a set of `Donjon`. */
  allDonjons?: Maybe<DonjonsConnection>;
  /** Reads and enables pagination through a set of `Item`. */
  allItems?: Maybe<ItemsConnection>;
  /** Reads and enables pagination through a set of `Loot`. */
  allLoots?: Maybe<LootsConnection>;
  /** Reads and enables pagination through a set of `Merit`. */
  allMerits?: Maybe<MeritsConnection>;
  /** Reads and enables pagination through a set of `PlayerMerit`. */
  allPlayerMerits?: Maybe<PlayerMeritsConnection>;
  /** Reads and enables pagination through a set of `PlayerSlot`. */
  allPlayerSlots?: Maybe<PlayerSlotsConnection>;
  /** Reads and enables pagination through a set of `Player`. */
  allPlayers?: Maybe<PlayersConnection>;
  /** Reads and enables pagination through a set of `RaidPlayer`. */
  allRaidPlayers?: Maybe<RaidPlayersConnection>;
  /** Reads and enables pagination through a set of `Raid`. */
  allRaids?: Maybe<RaidsConnection>;
  /** Reads and enables pagination through a set of `Slot`. */
  allSlots?: Maybe<SlotsConnection>;
};

/** The root query type which gives access points into the data universe. */
export type QueryNodeArgs = {
  nodeId: Scalars["ID"];
};

/** The root query type which gives access points into the data universe. */
export type QueryAllBossItemsArgs = {
  first?: Maybe<Scalars["Int"]>;
  last?: Maybe<Scalars["Int"]>;
  offset?: Maybe<Scalars["Int"]>;
  before?: Maybe<Scalars["Cursor"]>;
  after?: Maybe<Scalars["Cursor"]>;
  orderBy?: Maybe<Array<BossItemsOrderBy>>;
  condition?: Maybe<BossItemCondition>;
};

/** The root query type which gives access points into the data universe. */
export type QueryAllBossesArgs = {
  first?: Maybe<Scalars["Int"]>;
  last?: Maybe<Scalars["Int"]>;
  offset?: Maybe<Scalars["Int"]>;
  before?: Maybe<Scalars["Cursor"]>;
  after?: Maybe<Scalars["Cursor"]>;
  orderBy?: Maybe<Array<BossesOrderBy>>;
  condition?: Maybe<BossCondition>;
};

/** The root query type which gives access points into the data universe. */
export type QueryAllClassItemsArgs = {
  first?: Maybe<Scalars["Int"]>;
  last?: Maybe<Scalars["Int"]>;
  offset?: Maybe<Scalars["Int"]>;
  before?: Maybe<Scalars["Cursor"]>;
  after?: Maybe<Scalars["Cursor"]>;
  orderBy?: Maybe<Array<ClassItemsOrderBy>>;
  condition?: Maybe<ClassItemCondition>;
};

/** The root query type which gives access points into the data universe. */
export type QueryAllClassesArgs = {
  first?: Maybe<Scalars["Int"]>;
  last?: Maybe<Scalars["Int"]>;
  offset?: Maybe<Scalars["Int"]>;
  before?: Maybe<Scalars["Cursor"]>;
  after?: Maybe<Scalars["Cursor"]>;
  orderBy?: Maybe<Array<ClassesOrderBy>>;
  condition?: Maybe<ClassCondition>;
};

/** The root query type which gives access points into the data universe. */
export type QueryAllDonjonsArgs = {
  first?: Maybe<Scalars["Int"]>;
  last?: Maybe<Scalars["Int"]>;
  offset?: Maybe<Scalars["Int"]>;
  before?: Maybe<Scalars["Cursor"]>;
  after?: Maybe<Scalars["Cursor"]>;
  orderBy?: Maybe<Array<DonjonsOrderBy>>;
  condition?: Maybe<DonjonCondition>;
};

/** The root query type which gives access points into the data universe. */
export type QueryAllItemsArgs = {
  first?: Maybe<Scalars["Int"]>;
  last?: Maybe<Scalars["Int"]>;
  offset?: Maybe<Scalars["Int"]>;
  before?: Maybe<Scalars["Cursor"]>;
  after?: Maybe<Scalars["Cursor"]>;
  orderBy?: Maybe<Array<ItemsOrderBy>>;
  condition?: Maybe<ItemCondition>;
};

/** The root query type which gives access points into the data universe. */
export type QueryAllLootsArgs = {
  first?: Maybe<Scalars["Int"]>;
  last?: Maybe<Scalars["Int"]>;
  offset?: Maybe<Scalars["Int"]>;
  before?: Maybe<Scalars["Cursor"]>;
  after?: Maybe<Scalars["Cursor"]>;
  orderBy?: Maybe<Array<LootsOrderBy>>;
  condition?: Maybe<LootCondition>;
};

/** The root query type which gives access points into the data universe. */
export type QueryAllMeritsArgs = {
  first?: Maybe<Scalars["Int"]>;
  last?: Maybe<Scalars["Int"]>;
  offset?: Maybe<Scalars["Int"]>;
  before?: Maybe<Scalars["Cursor"]>;
  after?: Maybe<Scalars["Cursor"]>;
  orderBy?: Maybe<Array<MeritsOrderBy>>;
  condition?: Maybe<MeritCondition>;
};

/** The root query type which gives access points into the data universe. */
export type QueryAllPlayerMeritsArgs = {
  first?: Maybe<Scalars["Int"]>;
  last?: Maybe<Scalars["Int"]>;
  offset?: Maybe<Scalars["Int"]>;
  before?: Maybe<Scalars["Cursor"]>;
  after?: Maybe<Scalars["Cursor"]>;
  orderBy?: Maybe<Array<PlayerMeritsOrderBy>>;
  condition?: Maybe<PlayerMeritCondition>;
};

/** The root query type which gives access points into the data universe. */
export type QueryAllPlayerSlotsArgs = {
  first?: Maybe<Scalars["Int"]>;
  last?: Maybe<Scalars["Int"]>;
  offset?: Maybe<Scalars["Int"]>;
  before?: Maybe<Scalars["Cursor"]>;
  after?: Maybe<Scalars["Cursor"]>;
  orderBy?: Maybe<Array<PlayerSlotsOrderBy>>;
  condition?: Maybe<PlayerSlotCondition>;
};

/** The root query type which gives access points into the data universe. */
export type QueryAllPlayersArgs = {
  first?: Maybe<Scalars["Int"]>;
  last?: Maybe<Scalars["Int"]>;
  offset?: Maybe<Scalars["Int"]>;
  before?: Maybe<Scalars["Cursor"]>;
  after?: Maybe<Scalars["Cursor"]>;
  orderBy?: Maybe<Array<PlayersOrderBy>>;
  condition?: Maybe<PlayerCondition>;
};

/** The root query type which gives access points into the data universe. */
export type QueryAllRaidPlayersArgs = {
  first?: Maybe<Scalars["Int"]>;
  last?: Maybe<Scalars["Int"]>;
  offset?: Maybe<Scalars["Int"]>;
  before?: Maybe<Scalars["Cursor"]>;
  after?: Maybe<Scalars["Cursor"]>;
  orderBy?: Maybe<Array<RaidPlayersOrderBy>>;
  condition?: Maybe<RaidPlayerCondition>;
};

/** The root query type which gives access points into the data universe. */
export type QueryAllRaidsArgs = {
  first?: Maybe<Scalars["Int"]>;
  last?: Maybe<Scalars["Int"]>;
  offset?: Maybe<Scalars["Int"]>;
  before?: Maybe<Scalars["Cursor"]>;
  after?: Maybe<Scalars["Cursor"]>;
  orderBy?: Maybe<Array<RaidsOrderBy>>;
  condition?: Maybe<RaidCondition>;
};

/** The root query type which gives access points into the data universe. */
export type QueryAllSlotsArgs = {
  first?: Maybe<Scalars["Int"]>;
  last?: Maybe<Scalars["Int"]>;
  offset?: Maybe<Scalars["Int"]>;
  before?: Maybe<Scalars["Cursor"]>;
  after?: Maybe<Scalars["Cursor"]>;
  orderBy?: Maybe<Array<SlotsOrderBy>>;
  condition?: Maybe<SlotCondition>;
};

export type Raid = {
  __typename?: "Raid";
  id: Scalars["Int"];
  donjonId?: Maybe<Scalars["Int"]>;
  date?: Maybe<Scalars["String"]>;
  /** Reads a single `Donjon` that is related to this `Raid`. */
  donjonByDonjonId?: Maybe<Donjon>;
  /** Reads and enables pagination through a set of `Loot`. */
  lootsByRaidId: LootsConnection;
  /** Reads and enables pagination through a set of `RaidPlayer`. */
  raidPlayersByRaidId: RaidPlayersConnection;
};

export type RaidLootsByRaidIdArgs = {
  first?: Maybe<Scalars["Int"]>;
  last?: Maybe<Scalars["Int"]>;
  offset?: Maybe<Scalars["Int"]>;
  before?: Maybe<Scalars["Cursor"]>;
  after?: Maybe<Scalars["Cursor"]>;
  orderBy?: Maybe<Array<LootsOrderBy>>;
  condition?: Maybe<LootCondition>;
};

export type RaidRaidPlayersByRaidIdArgs = {
  first?: Maybe<Scalars["Int"]>;
  last?: Maybe<Scalars["Int"]>;
  offset?: Maybe<Scalars["Int"]>;
  before?: Maybe<Scalars["Cursor"]>;
  after?: Maybe<Scalars["Cursor"]>;
  orderBy?: Maybe<Array<RaidPlayersOrderBy>>;
  condition?: Maybe<RaidPlayerCondition>;
};

/** A condition to be used against `Raid` object types. All fields are tested for equality and combined with a logical ‘and.’ */
export type RaidCondition = {
  /** Checks for equality with the object’s `id` field. */
  id?: Maybe<Scalars["Int"]>;
  /** Checks for equality with the object’s `donjonId` field. */
  donjonId?: Maybe<Scalars["Int"]>;
  /** Checks for equality with the object’s `date` field. */
  date?: Maybe<Scalars["String"]>;
};

export type RaidPlayer = {
  __typename?: "RaidPlayer";
  id: Scalars["Int"];
  playerId?: Maybe<Scalars["Int"]>;
  raidId?: Maybe<Scalars["Int"]>;
  /** Reads a single `Player` that is related to this `RaidPlayer`. */
  playerByPlayerId?: Maybe<Player>;
  /** Reads a single `Raid` that is related to this `RaidPlayer`. */
  raidByRaidId?: Maybe<Raid>;
};

/**
 * A condition to be used against `RaidPlayer` object types. All fields are tested
 * for equality and combined with a logical ‘and.’
 **/
export type RaidPlayerCondition = {
  /** Checks for equality with the object’s `id` field. */
  id?: Maybe<Scalars["Int"]>;
  /** Checks for equality with the object’s `playerId` field. */
  playerId?: Maybe<Scalars["Int"]>;
  /** Checks for equality with the object’s `raidId` field. */
  raidId?: Maybe<Scalars["Int"]>;
};

/** An input for mutations affecting `RaidPlayer` */
export type RaidPlayerInput = {
  id?: Maybe<Scalars["Int"]>;
  playerId?: Maybe<Scalars["Int"]>;
  raidId?: Maybe<Scalars["Int"]>;
};

/** A connection to a list of `RaidPlayer` values. */
export type RaidPlayersConnection = {
  __typename?: "RaidPlayersConnection";
  /** A list of `RaidPlayer` objects. */
  nodes: Array<Maybe<RaidPlayer>>;
  /** A list of edges which contains the `RaidPlayer` and cursor to aid in pagination. */
  edges: Array<RaidPlayersEdge>;
  /** Information to aid in pagination. */
  pageInfo: PageInfo;
  /** The count of *all* `RaidPlayer` you could get from the connection. */
  totalCount: Scalars["Int"];
};

/** A `RaidPlayer` edge in the connection. */
export type RaidPlayersEdge = {
  __typename?: "RaidPlayersEdge";
  /** A cursor for use in pagination. */
  cursor?: Maybe<Scalars["Cursor"]>;
  /** The `RaidPlayer` at the end of the edge. */
  node?: Maybe<RaidPlayer>;
};

/** Methods to use when ordering `RaidPlayer`. */
export enum RaidPlayersOrderBy {
  Natural = "NATURAL",
  IdAsc = "ID_ASC",
  IdDesc = "ID_DESC",
  PlayerIdAsc = "PLAYER_ID_ASC",
  PlayerIdDesc = "PLAYER_ID_DESC",
  RaidIdAsc = "RAID_ID_ASC",
  RaidIdDesc = "RAID_ID_DESC"
}

/** A connection to a list of `Raid` values. */
export type RaidsConnection = {
  __typename?: "RaidsConnection";
  /** A list of `Raid` objects. */
  nodes: Array<Maybe<Raid>>;
  /** A list of edges which contains the `Raid` and cursor to aid in pagination. */
  edges: Array<RaidsEdge>;
  /** Information to aid in pagination. */
  pageInfo: PageInfo;
  /** The count of *all* `Raid` you could get from the connection. */
  totalCount: Scalars["Int"];
};

/** A `Raid` edge in the connection. */
export type RaidsEdge = {
  __typename?: "RaidsEdge";
  /** A cursor for use in pagination. */
  cursor?: Maybe<Scalars["Cursor"]>;
  /** The `Raid` at the end of the edge. */
  node?: Maybe<Raid>;
};

/** Methods to use when ordering `Raid`. */
export enum RaidsOrderBy {
  Natural = "NATURAL",
  IdAsc = "ID_ASC",
  IdDesc = "ID_DESC",
  DonjonIdAsc = "DONJON_ID_ASC",
  DonjonIdDesc = "DONJON_ID_DESC",
  DateAsc = "DATE_ASC",
  DateDesc = "DATE_DESC"
}

export type Slot = {
  __typename?: "Slot";
  id: Scalars["Int"];
  name?: Maybe<Scalars["String"]>;
  /** Reads and enables pagination through a set of `PlayerSlot`. */
  playerSlotsBySlotId: PlayerSlotsConnection;
};

export type SlotPlayerSlotsBySlotIdArgs = {
  first?: Maybe<Scalars["Int"]>;
  last?: Maybe<Scalars["Int"]>;
  offset?: Maybe<Scalars["Int"]>;
  before?: Maybe<Scalars["Cursor"]>;
  after?: Maybe<Scalars["Cursor"]>;
  orderBy?: Maybe<Array<PlayerSlotsOrderBy>>;
  condition?: Maybe<PlayerSlotCondition>;
};

/** A condition to be used against `Slot` object types. All fields are tested for equality and combined with a logical ‘and.’ */
export type SlotCondition = {
  /** Checks for equality with the object’s `id` field. */
  id?: Maybe<Scalars["Int"]>;
  /** Checks for equality with the object’s `name` field. */
  name?: Maybe<Scalars["String"]>;
};

/** A connection to a list of `Slot` values. */
export type SlotsConnection = {
  __typename?: "SlotsConnection";
  /** A list of `Slot` objects. */
  nodes: Array<Maybe<Slot>>;
  /** A list of edges which contains the `Slot` and cursor to aid in pagination. */
  edges: Array<SlotsEdge>;
  /** Information to aid in pagination. */
  pageInfo: PageInfo;
  /** The count of *all* `Slot` you could get from the connection. */
  totalCount: Scalars["Int"];
};

/** A `Slot` edge in the connection. */
export type SlotsEdge = {
  __typename?: "SlotsEdge";
  /** A cursor for use in pagination. */
  cursor?: Maybe<Scalars["Cursor"]>;
  /** The `Slot` at the end of the edge. */
  node?: Maybe<Slot>;
};

/** Methods to use when ordering `Slot`. */
export enum SlotsOrderBy {
  Natural = "NATURAL",
  IdAsc = "ID_ASC",
  IdDesc = "ID_DESC",
  NameAsc = "NAME_ASC",
  NameDesc = "NAME_DESC"
}
