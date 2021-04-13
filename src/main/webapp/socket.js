const express = require("express");
const http = require("http");
const mysql = require("mysql");
const path = require("path");
const socketio = require("socket.io");
const cors = require("cors");

const app = express();
const server = http.createServer(app);
const io = socketio(server);

require("./data/connect");

// configure middleware
app.set("views", __dirname + "/views"); // set express to look in this folder to render our view
app.set("view engine", "ejs"); // configure template engine
app.use(express.static(path.join(__dirname, "public"))); // configure express to use public folder
app.use(cors());

// const routes = require("./routes");

// connection.end();
app.get("/", (req, res) => {
  var mess = "LE QUANG HAONG";
  res.render("lobby.ejs", { a: mess });
});

// set the app to listen on the port
server.listen(4000, () => {
  console.log(`http://localhost:4000/`);
});

io.on("connection", (socket) => {
  console.log("socketio started");
  socket.emit("hello");
});
