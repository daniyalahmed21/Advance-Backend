const express = require("express")
const bodyParser = require("body-parser")
const app = express()


app.use(bodyParser.text())
app.use(bodyParser.json())

app.get("/",(req,res)=>{
    const {name,age} = req.query
    res.json({
        name,
        age
    })


})

app.listen(3000,()=>{
    console.log("Server running at port 3000")
})