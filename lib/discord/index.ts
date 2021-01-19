import CONFIG from "../../server/config";

export function sendDiscordMessage(
  userId: string,
  message: string,
  token: string
) {
  if (!userId || !message || !token) {
    return null;
  }
  return fetch(`${CONFIG.SERVER_URL}/api/discord`, {
    method: "POST",
    headers: {
      Accept: "application/json",
      "Content-Type": "application/json",
      authorization: token
    },
    body: JSON.stringify({
      discordId: userId,
      message
    })
  })
    .then(response => response.json())
    .catch(error => {
      console.log(error);
    });
}
