const mysql = require("mysql");

exports.conn = mysql.createConnection({
  host: "localhost",
  user: "root",
  password: "admin",
  database: "webtracnghiem",
  // insecureAuth : true
});
