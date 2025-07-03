const express = require("express");
const bodyParser = require("body-parser");
const app = express();
const { PORT } = require("./config/server.config");
const TodoRouter = require("./routes/todo.routes");

app.use(bodyParser.text());
app.use(bodyParser.json());
app.use(bodyParser.urlencoded());


app.use("/",TodoRouter)

app.listen(PORT, () => {
  console.log("Server running at port 3000");
});
