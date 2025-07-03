const express = require ("express")
const TodoRouter =express.Router()
const {getTodos} =  require ("../controllers/todo.controller")
const {createTodo} = require ("../controllers/todo.controller")

TodoRouter.get("/",getTodos)
TodoRouter.post("/",createTodo)

module.exports = TodoRouter