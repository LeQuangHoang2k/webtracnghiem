// const mysql = require("mysql2/promise");
const mysql2 = require("mysql2");

exports.conn = mysql2.createConnection({
  host: "localhost",
  user: "root",
  password: "admin",
  database: "webtracnghiem",
});

// create the connection
// const con = mysql2.createConnection({
//   host: "localhost",
//   user: "root",
//   password: "admin",
//   database: "webtracnghiem",
// });

// const main = async () => {
//   var c = [];
//   const abc = (rows) => {
//     c = rows;
//     // console.log(c);
//   };
//   await con
//     .promise()
//     .query("SELECT * FROM user")
//     .then(([rows, fields]) => {
//       // console.log(rows);
//       abc(rows);
//     })
//     .catch(console.log)
//     .then(() => con.end());
//   console.log(c);
// };
// main();
