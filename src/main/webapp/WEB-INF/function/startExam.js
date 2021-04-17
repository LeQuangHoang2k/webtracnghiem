const mysql = require("mysql2");

exports.startExam = (io, socket, data) => {
  console.log(data.roomId);
  const { roomId } = data;
  //

  //

  //

  // response
  console.log(roomId);
  io.in(roomId).emit("all-member-start-success");
};
