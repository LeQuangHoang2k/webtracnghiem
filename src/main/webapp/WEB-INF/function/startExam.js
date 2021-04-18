const mysql = require("mysql2");

exports.startExam = (io, socket, data) => {
  const { roomId, optionExam } = data;
  console.log(roomId, optionExam);
  //

  const { option } = getOptionExam(optionExam);
  console.log("option", option);
  //

  //

  // response
  io.in(roomId).emit("all-member-start-success");
};

const getOptionExam = (optionExam) => {
  let array = [];
  let option = {};

  array = optionExam.split("&");
  array.forEach((item) => {
    item = item.split("=");
    option[item[0]] = item[1];
  });

  return { option };
};
