const { conn } = require("../data/connect");

exports.joinRoom = async (socket, data) => {
  console.log("join room");

  //input
  if (!data && data === "") return console.log("không join dc");

  //db
  await checkRoomUsableById(data);
  // console.log(checkRoomUsableById(data));
};

const checkRoomUsableById = async (id) => {
  let status = false;

  const getResult = (rows) => {
    console.log(rows);
    if (rows.usable) return (status = true);
  };

  await conn
    .promise()
    .query(`SELECT * FROM room WHERE id=${id}`)
    .then(([rows]) => {
      getResult(rows[0]);
    });

  console.log(status);
  return status;
};
