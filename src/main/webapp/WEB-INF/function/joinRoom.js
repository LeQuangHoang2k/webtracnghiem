const { conn } = require("../data/connect");

let globalListRoomMember = [];
exports.joinRoom = async (io, socket, data) => {
  console.log("join room");

  //input
  const { id, username, roomId } = data;
  if (!roomId && roomId === "") return console.log("không join dc");

  //db
  const status = await checkRoomUsableById(roomId);
  if (!status) return socket.emit("join-room-failed");

  //main
  await addSocket(socket, roomId);
  // await checkMember(id, username);
  await addMember(id, username);

  //res
  response(io, socket, roomId);
};

exports.leaveRoom = (socket) => {
  globalListRoomMember.splice(
    globalListRoomMember.findIndex((user) => {
      user.id === socket.id;
    }),
    1
  )[0];
  console.log("disconnect", globalListRoomMember);
};

const checkRoomUsableById = async (id) => {
  let status = false;

  const getResult = (rows) => {
    // console.log(rows);
    if (rows.usable) return (status = true);
  };

  await conn
    .promise()
    .query(`SELECT * FROM room WHERE id=${id}`)
    .then(([rows]) => {
      getResult(rows[0]);
    });

  return status;
};

const addSocket = (socket, roomId) => {
  socket.join(roomId);
  console.log("join", roomId);
  console.log(socket.adapter.rooms[roomId]);
};

// const checkMember = (id, username) => {
//   console.log("a", globalListRoomMember);
//   // console.log("check", check);
// };

const addMember = (id, username) => {
  globalListRoomMember.push({ id, username });
  console.log(globalListRoomMember);
};

const response = (io, socket, roomId) => {
  io.to(roomId).emit("join-room-success");
};
