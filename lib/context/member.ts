import React from "react";

export interface MemberInfos {
  userid: number;
  name: string;
  role: string;
  level: number;
  discordId: string;
  token: string;
}

const MemberContext = React.createContext<MemberInfos>({
  userid: -1,
  name: "",
  role: "guest",
  level: 0,
  discordId: null,
  token: null
});

export default MemberContext;
