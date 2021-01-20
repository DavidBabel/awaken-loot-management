import React from "react";

export interface MemberInfos {
  userid: number;
  name: string;
  role: string;
  level: number;
  discordId: string;
  token: string;
  classId: number;
}

const MemberContext = React.createContext<MemberInfos>({
  userid: -1,
  name: "",
  role: "guest",
  level: 0,
  discordId: null,
  token: null,
  classId: null
});

export default MemberContext;
