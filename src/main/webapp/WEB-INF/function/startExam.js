const { conn } = require("../data/connect");

exports.startExam = async (io, socket, data) => {
  const { roomId, optionExam } = data;
  console.log(roomId, optionExam);

  //
  const { option } = await getOptionExam(optionExam);
  const { topic, difficult } = option;

  //
  const { listQuestion, listAnswer, arrayQuestionId } = await getExamFromDb({
    topic,
    difficult,
  });
  // console.log("listQuestion, listAnswer", arrayQuestionId);

  //

  // response
  io.in(roomId).emit("all-member-start-success", {
    listQuestion,
    listAnswer,
    arrayQuestionId,
  });
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

const getExamFromDb = async ({ topic, difficult }) => {
  const { listQuestion, arrayQuestionId } = await getListQuestionDb({
    topic,
    difficult,
  });
  const { listAnswer } = await getListAnswerDb(arrayQuestionId);

  return { listQuestion, listAnswer, arrayQuestionId };
};

const getListQuestionDb = async ({ topic, difficult }) => {
  let listQuestion = null;
  let arrayQuestionId = [];

  const getListQuestion = (rows) => {
    listQuestion = rows;
  };

  const getArrayQuestionId = (rows) => {
    rows.forEach((item) => {
      arrayQuestionId.push(item.id);
    });

    arrayQuestionId = "(" + arrayQuestionId.toString() + ")";
  };

  await conn
    .promise()
    .query(
      `SELECT * FROM question WHERE category="${topic}" AND difficult="${difficult}" ORDER BY RAND() LIMIT 10`
    )
    .then(([rows]) => {
      getListQuestion(rows);
      getArrayQuestionId(rows);
    });

  return { listQuestion, arrayQuestionId };
};

const getListAnswerDb = async (arrayQuestionId) => {
  let listAnswer = null;

  const getListAnswer = (rows) => {
    listAnswer = rows;
  };

  // `SELECT * FROM answer WHERE id_question in (SELECT t.id FROM (SELECT id FROM question ORDER BY rand() LIMIT 10 ) as t)`
  await conn
    .promise()
    .query(`SELECT * FROM answer WHERE id_question IN ${arrayQuestionId}`)
    .then(([rows]) => {
      getListAnswer(rows);
    });
  return { listAnswer };
};
