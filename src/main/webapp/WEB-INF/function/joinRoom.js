const { conn } = require("../data/connect");

let globalListRoomMember = [];
let globalRoomId = null;

exports.joinRoom = async (io, socket, data) => {
  console.log("join room");

  //input
  const { id, username, name, roomId } = data;
  if (!roomId && roomId === "") return console.log("không join dc");

  //db
  const { status, creatorId } = await checkRoomUsableById(roomId);
  if (!status) return socket.emit("join-room-failed");
  console.log("creator", creatorId);

  //main
  globalRoomId = roomId;
  await addSocket(socket, roomId);
  const index = await checkMemberExistInRoom(socket, username);
  if (index < 0) addMember(id, username, name);

  //res
  response(io, socket, roomId, creatorId);
};

exports.leaveRoom = (io, socket) => {
  const index = globalListRoomMember.findIndex(
    (item) => item.username === socket.username
  );

  globalListRoomMember.splice(index, 1);

  const message = `${socket.username} da roi khoi room ${socket.id}`;
  io.in(globalRoomId).emit("someone-leave-room", globalListRoomMember);

  console.log("globalRoomId", globalRoomId);
  socket.leave(globalRoomId);
  console.log(socket.adapter.rooms);
  console.log("disconnect", globalListRoomMember);
};

const checkRoomUsableById = async (id) => {
  let status = false;
  let creatorId = null;

  const getResult = (rows) => {
    // console.log(rows);
    if (!rows.usable) return;
    creatorId = rows.id_creator;
    status = true;
  };

  await conn
    .promise()
    .query(`SELECT * FROM room WHERE id=${id}`)
    .then(([rows]) => {
      getResult(rows[0]);
    });

  return { status, creatorId };
};

const addSocket = (socket, roomId) => {
  socket.join(roomId);
  console.log("join", roomId);
  console.log(socket.adapter.rooms);
};

const checkMemberExistInRoom = (socket, username) => {
  const index = globalListRoomMember.findIndex(
    (item) => item.username === socket.username
  );
  console.log("index", index);
  return index;
};

const addMember = (id, username, name) => {
  globalListRoomMember.push({ id, username, name });
  console.log(globalListRoomMember);
};

const response = (io, socket, roomId, creatorId) => {
  console.log("response", roomId, globalListRoomMember);
  console.log(socket.adapter.rooms[roomId]);
  // socket.emit("join-room-success", globalListRoomMember);
  // socket.broadcast.emit("join-room-success", globalListRoomMember)
  io.in(roomId).emit("join-room-success", {
    listMember: globalListRoomMember,
    roomId,
    creatorId,
  });
};
