import { useState } from 'react';
import CONFIG from '../server/config';

function tryToLogin(username, password, setMessage) {
  console.log(`${CONFIG.SERVER_URL}/login`);
  fetch(`${CONFIG.SERVER_URL}/login`, {
    method: 'POST',
    headers: {
      Accept: 'application/json',
      'Content-Type': 'application/json'
    },
    body: JSON.stringify({
      username,
      password
    })
  })
    .then(response => response.json())
    .then(jwtInfos => {
      if (jwtInfos.error) {
        setMessage('NOT WORKING');
      } else {
        setMessage('LoggedIn');
        localStorage.setItem('auth_token', jwtInfos.jwt);
      }
    });
}

export default function PageLogin() {
  const [username, setUsername] = useState('');
  const [password, setPassword] = useState('');
  const [message, setMessage] = useState('');
  return (
    <>
      <div>
        <input
          type="text"
          name="login"
          onChange={(e: React.ChangeEvent<HTMLInputElement>) =>
            setUsername(e.target.value)
          }
        />
        <input
          type="text"
          name="password"
          onChange={(e: React.ChangeEvent<HTMLInputElement>) =>
            setPassword(e.target.value)
          }
        />
      </div>
      {message}
      <div>
        <button
          disabled={!username || !password}
          onClick={() => tryToLogin(username, password, setMessage)}
        >
          Send
        </button>
      </div>
    </>
  );
}
