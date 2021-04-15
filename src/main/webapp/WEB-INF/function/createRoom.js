const { conn } = require("../data/connect");

exports.createRoom = (socket, data) => {
  console.log("create room here! ");
  console.log(data);

  //input
  const { id } = getIdFromCookie(data);

  //db
  createRoomByCreatorId(id);
  selectRoomLastedById(socket, id);
};

const getIdFromCookie = (data) => {
  var array = [];
  var object = {};

  array = data.split("; ");
  array.forEach((item) => {
    item = item.split("=");
    object[item[0]] = item[1];
  });

  return object;
};

const createRoomByCreatorId = (id) => {
  conn.query(`INSERT INTO room (id_creator,active) VALUES (${id},true)`, (err, result) => {
    console.log("create thanh cong");
  });
};

const selectRoomLastedById = (socket, id) => {
  conn.query(
    `SELECT id FROM room WHERE id_creator=${id} ORDER BY id DESC LIMIT 1`,
    (err, result) => {
      response(socket, result[0]);
    }
  );
};

const response = (socket, data) => {
  console.log(data);

  socket.emit("create-room-success",data);
};
