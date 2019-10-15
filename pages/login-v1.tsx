import jwt from "jsonwebtoken";
import md5 from "md5";
import Router from "next/router";
import { setCookie } from "nookies";
import { useState } from "react";
import { role } from "../lib/role-level";
import CONFIG from "../server/config";
interface JwtToken {
  error: string;
  jwt: string;
}

// TODO move this

function tryToLogin(
  username: string,
  password: string,
  callback: (jwtInfos: JwtToken) => void
) {
  fetch(`${CONFIG.SERVER_URL}/api/login`, {
    method: "POST",
    headers: {
      Accept: "application/json",
      "Content-Type": "application/json"
    },
    body: JSON.stringify({
      username,
      password: md5(password)
    })
  })
    .then(response => response.json())
    .then(callback);
}

export default function PageLogin() {
  const [username, setUsername] = useState("");
  const [password, setPassword] = useState("");
  const [message, setMessage] = useState("");
  return (
    <>
      {/* <form action=""> */}
      <div>
        <input
          type="text"
          name="login"
          onChange={(e: React.ChangeEvent<HTMLInputElement>) =>
            setUsername(e.target.value)
          }
        />
        <input
          type="password"
          name="password"
          onChange={(e: React.ChangeEvent<HTMLInputElement>) =>
            setPassword(e.target.value)
          }
        />
      </div>
      {message}
      <div>
        <input
          type="button"
          value="Send"
          disabled={!username || !password}
          onClick={() =>
            tryToLogin(username, password, jwtInfos => {
              if (jwtInfos.error) {
                setMessage("NOT WORKING");
              } else {
                setMessage("LoggedIn");
                const memberInfos: any = jwt.decode(jwtInfos.jwt);
                const payload = JSON.stringify({
                  name: username,
                  role: memberInfos.role,
                  level: role[memberInfos.role] || 0,
                  token: jwtInfos.jwt
                });
                // localStorage.setItem('token', jwtInfos.jwt);
                setCookie({}, "member", payload, {
                  maxAge: 30 * 24 * 60 * 60,
                  path: "/"
                });
                Router.push("/");
              }
            })
          }
        />
      </div>
      {/* </form> */}
    </>
  );
}
