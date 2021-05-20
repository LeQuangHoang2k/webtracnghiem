// const mysql = require("mysql2/promise");
const mysql2 = require("mysql2");

// exports.conn = mysql2.createConnection({
//   host: "localhost",
//   user: "root",
//   password: "admin",
//   database: "webtracnghiem",
// });

exports.conn = mysql2.createConnection({
  host: "freedb.tech",
  port: 3306,
  user: "freedbtech_crim",
  password: "crim159555",
  database: "freedbtech_webtracnghiem",
});