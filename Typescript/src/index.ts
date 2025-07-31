import express from "express";
import serverConfig from "./config/server.config";
const app = express();

app.get("/", (_, res) => {
  res.send("Hello World!");
});

app.listen(serverConfig.PORT, () => {
  console.log(`Server running at http://localhost:${serverConfig.PORT}`);
});
