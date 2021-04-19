const { conn } = require("../data/connect");

exports.saveMember = async (io, socket, data) => {
  let { userCookieId, currentScore, roomId } = data;
  console.log(data);

  userCookieId = parseInt(userCookieId);
  currentScore = parseInt(currentScore);
  roomId = parseInt(roomId);

  console.log(roomId);

  await saveRoomMember({ userCookieId, currentScore, roomId });

  socket.emit("save-member-success");
};

const saveRoomMember = async ({ userCookieId, currentScore, roomId }) => {
  conn
    .promise()
    .query(
      `INSERT INTO room_member (id_room,id_user,score) VALUES (${roomId},${userCookieId},${currentScore})`
    );
};

// const findBestPlayer = async ({ roomId }) => {
//   const getResult2 = (rows) => {
//     return { rows };
//   };

//   const myTimeout = setTimeout(() => {
//     const getResult = (rows) => {
//       //   console.log("37", rows);
//       getResult2(rows);
//     };

//     conn
//       .promise()
//       .query(
//         `SELECT * FROM room_member WHERE id_room=${roomId} ORDER BY score LIMIT 3`
//       )
//       .then(async ([rows]) => {
//         await getResult(rows);
//         clearTimeout(myTimeout);
//       });
//   }, 2000);

//   const { rows } = getResult2();
//   console.log("37", rows);
//   return { rows };
// };
