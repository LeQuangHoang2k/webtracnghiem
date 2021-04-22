const { conn } = require("../data/connect");

exports.fetchInfo = async (socket, data) => {
  //input
  console.log("fetch infor");
  if (!data) return console.log("error : input");

  //db

  //main
  const { username } = await convertToObject(data);
  const { userInfor } = await getUserInfo(username);
  await saveInfoInSocket(socket, userInfor);

  //res
  await response(socket, userInfor);
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

const getUserInfo = async (username) => {
  console.log("query by username");

  var userInfor = null;

  const getResult = (data) => {
    userInfor = data;
  };
  await conn
    .promise()
    .query(`SELECT * FROM user WHERE username="${username}"`)
    .then(([rows]) => {
      getResult(rows[0]);
    });

  return { userInfor };
};

const saveInfoInSocket = (socket, userInfor) => {
  socket.userId = userInfor.id;
  socket.username = userInfor.username;
  socket.clientName = userInfor.name;
};

const response = (socket, userInfor) => {
  // userInfor = data;
  console.log(userInfor);
  socket.emit("fetch-info-success", { userInfor });
};
