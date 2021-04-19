const { conn } = require("../data/connect");

exports.showRank = async (io, socket, data) => {
  console.log(data);
  //
  const { roomId } = data;

  const { listRank } = await findThreeBestPlayer(roomId);

  await response(socket, listRank);
};

const findThreeBestPlayer = async (roomId) => {
  let listRank = null;

  const getResult = (rows) => {
    listRank = rows;
    console.log("17", rows);
  };

  await conn
    .promise()
    .query(
      `SELECT name,score FROM room_member,user WHERE id_room=${roomId} AND room_member.id_user=user.id ORDER BY score LIMIT 3`
    )
    .then(([rows]) => {
      console.log("25", rows);
      getResult(rows);
    });

  console.log("rank", listRank);

  return { listRank };
};

const response = (socket, listRank) => {
  socket.emit("show-rank-success", { listRank });
};
