const express = require("express");
const http = require("http");

const app = express();

app.get("/", async (req, res) => {
  res.send({ v: 2, message: "hello world" });
});

http.createServer(app).listen(process.env.PORT || 8000);
