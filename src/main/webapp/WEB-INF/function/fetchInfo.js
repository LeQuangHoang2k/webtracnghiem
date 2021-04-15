const { conn } = require("../data/connect");

exports.fetchInfo = (socket, data) => {
  //input
  if (!data) return console.log("error : input");

  //db
  const { username } = convertToObject(data);
  getUserInfo(socket, username);
};

const convertToObject = (data) => {
  console.log(data);

  let array = [];
  let object = {};

  array = data.split("; ");
  array.forEach((item) => {
    item = item.split("=");
    object[item[0]] = item[1];
  });

  return object;
};

const getUserInfo = async (socket, username) => {
  console.log("query by username");

  var userInfor = null;

  await conn.query(
    `SELECT * FROM user WHERE username=${username}`,
    (err, result) => {
      if (err) throw err;
      response(result[0]);
    }
  );

  const response = (data) => {
    userInfor = data;
    console.log(userInfor);
    socket.emit("fetch-info-success", userInfor);
  };
};
