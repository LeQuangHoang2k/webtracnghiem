const { conn } = require("../data/connect");

exports.createRoom = async (socket, data) => {
  console.log("create room here! ");
  console.log(data);

  //input
  const { id } = await getIdFromCookie(data);

  //db
  await createRoomByCreatorId(id);

  //main
  const { roomId } = await selectRoomLastedById(id);

  //res
  await response(socket, roomId);
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

const createRoomByCreatorId = async (id) => {
  await conn
    .promise()
    .query(`INSERT INTO room (id_creator,usable) VALUES (${id},true)`)
    .then(() => {
      console.log("create success");
    });
};

const selectRoomLastedById = async (id) => {
  let roomInfo = [];

  const getResult = (rows) => {
    roomInfo = rows;
  };

  await conn
    .promise()
    .query(
      `SELECT id FROM room WHERE id_creator=${id} ORDER BY id DESC LIMIT 1`
    )
    .then(([rows]) => {
      getResult(rows);
    });

  console.log(roomInfo);
  return { roomId: roomInfo[0].id };
};

const response = (socket, roomId) => {
  // console.log(data);

  console.log("65", roomId);
  socket.emit("create-room-success", { roomId });
};
