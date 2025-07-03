const http = require("http")

const server = http.createServer((req,res)=>{
    if(req.url==="/home"){
        res.end("Welcome to home page") //Ends the response
    }else{
        res.end("Welcome to website")
    }
})

server.listen("3000",()=>{
    console.log("New server up on port 3000");
})