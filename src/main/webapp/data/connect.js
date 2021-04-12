const mysql = require("mysql");

var conn = mysql.createConnection({
  host: "localhost",
  user: "root",
  password: "admin",
  // insecureAuth : true
});

conn.connect(function (err) {
  if (err) throw err;
  console.log("Connected!");
});

module.export = conn;
