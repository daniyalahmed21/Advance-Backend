import express from "express";
const v1Router = express.Router();

v1Router.get("/", () => {
  console.log("hello");
});

export default v1Router;
