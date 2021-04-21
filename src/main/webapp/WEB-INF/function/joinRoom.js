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
  const index = await checkMemberExistInRoom(socket, username, roomId);
  if (index < 0) addMember(id, username, name, roomId);
  const { listFilterRoom } = await filterRoom(socket, roomId);

  //res
  response(io, socket, roomId, creatorId, listFilterRoom);
};

exports.leaveRoom = (io, socket) => {
  const index = globalListRoomMember.findIndex(
    (item) =>
      item.username === socket.username && item.roomId === socket.clientRoom
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
    console.log(rows);
    if (!rows || !rows.usable) return console.log("room is blocked");
    creatorId = rows.id_creator;
    status = true;
  };

  await conn
    .promise()
    .query(`SELECT * FROM room WHERE id=${id}`)
    .then(([rows]) => {
      getResult(rows[0]);
    })
    .catch((err) => {
      console.log(err);
    });

  return { status, creatorId };
};

const addSocket = (socket, roomId) => {
  socket.join(roomId);
  socket.clientRoom = roomId;
  console.log("join", roomId);
  console.log(socket.adapter.rooms);
};

const checkMemberExistInRoom = (socket, username, roomId) => {
  const index = globalListRoomMember.findIndex(
    (item) => item.username === socket.username && item.clientRoom === roomId
  );
  console.log("index", index, socket.clientRoom);
  return index;
};

const addMember = (id, username, name, roomId) => {
  globalListRoomMember.push({ id, username, name, roomId });
  console.log("88", globalListRoomMember);
};

const filterRoom = (socket, roomId) => {
  console.log("92", globalListRoomMember);
  const listFilterRoom = globalListRoomMember.filter(
    (item) => (item.roomId === roomId)
  );

  console.log("listFilterRoom", listFilterRoom);

  return { listFilterRoom };
};

const response = (io, socket, roomId, creatorId, listFilterRoom) => {
  // console.log("response", roomId, listFilterRoom);
  // console.log(socket.adapter.rooms[roomId]);

  io.in(roomId).emit("join-room-success", {
    listMember: listFilterRoom,
    roomId,
    creatorId,
  });
};
