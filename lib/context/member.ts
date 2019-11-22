import React from "react";

export interface MemberInfos {
  userid: number;
  name: string;
  role: string;
  level: number;
  token: string;
}

const MemberContext = React.createContext<MemberInfos>({
  userid: -1,
  name: "",
  role: "guest",
  level: 0,
  token: null
});

export default MemberContext;
