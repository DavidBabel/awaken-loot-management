import { useState } from 'react';
import CONFIG from '../server/config';
import md5 from 'md5';

function tryToLogin(
  username: string,
  password: string,
  setMessage: React.Dispatch<React.SetStateAction<string>>
) {
  console.log(`${CONFIG.SERVER_URL}/login`);
  fetch(`${CONFIG.SERVER_URL}/login`, {
    method: 'POST',
    headers: {
      Accept: 'application/json',
      'Content-Type': 'application/json'
    },
    body: JSON.stringify({
      username,
      password: md5(password)
    })
  })
    .then(response => response.json())
    .then(jwtInfos => {
      if (jwtInfos.error) {
        setMessage('NOT WORKING');
      } else {
        setMessage('LoggedIn');
        localStorage.setItem('auth_token', jwtInfos.jwt);
        window.location.href = '/';
      }
    });
}

export default function PageLogin() {
  const [username, setUsername] = useState('');
  const [password, setPassword] = useState('');
  const [message, setMessage] = useState('');
  return (
    <>
      <form action="">
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
            type="submit"
            value="Send"
            disabled={!username || !password}
            onClick={() => tryToLogin(username, password, setMessage)}
          />
        </div>
      </form>
    </>
  );
}
