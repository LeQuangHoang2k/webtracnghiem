const express = require("express");
const http = require("http");
const mysql = require("mysql");
const path = require("path");
const socketio = require("socket.io");
const cors = require("cors");
var cookieParser = require('cookie-parser');

const app = express();
const server = http.createServer(app);
const io = socketio(server);

const conn = require("./data/connect");
app.use(express.static(path.join(__dirname, "public")));
app.set("view engine", "ejs");
app.set("views", __dirname + "/views");
app.use(cors());
app.use(cookieParser());

app.get("/", (req, res) => {
  res.render("lobby.ejs");
});

// set the app to listen on the port
server.listen(4000, () => {
  console.log(`http://localhost:4000/`);
});

io.on("connection", (socket) => {
  console.log("socketio started");
  socket.on("fetch-info",(data)=>{
    console.log(data);
  });
});
