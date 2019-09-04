import React from 'react';

export interface MemberInfos {
  name: string;
  role: string;
  level: number;
  token: string;
}

const MemberContext = React.createContext<MemberInfos>({
  name: '',
  role: 'guest',
  level: 0,
  token: null
});

export default MemberContext;
