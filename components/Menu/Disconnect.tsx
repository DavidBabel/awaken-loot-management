function resetToken() {
  localStorage.setItem('auth_token', undefined);
  window.location.href = '/';
}

export function Disconnect() {
  return <button onClick={resetToken}>Disconnect</button>;
}
