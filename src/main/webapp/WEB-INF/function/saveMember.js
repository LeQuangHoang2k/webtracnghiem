const { conn } = require("../data/connect");

exports.saveMember = async (io, socket, data) => {
  let { userCookie, correctAnswer, roomId } = data;
  console.log("5", data);

  const finalScore = await calculateScore({ userCookie, correctAnswer });
  await saveRoomMember({ userCookie, finalScore, roomId, correctAnswer });

  socket.emit("save-member-success");
};

const calculateScore = ({ userCookie, correctAnswer }) => {
  switch (userCookie.level) {
    case "Bronze": {
      const finalScore = getFinalScore({
        minCorrectAnswer: 5,
        k: 0,
        correctAnswer,
        difficult: userCookie.difficult,
      });
      return finalScore;
    }
    case "Silver": {
      const finalScore = getFinalScore({
        minCorrectAnswer: 6,
        k: 1,
        correctAnswer,
        difficult: userCookie.difficult,
      });
      return finalScore;
    }
    case "Gold": {
      const finalScore = getFinalScore({
        minCorrectAnswer: 7,
        k: 2,
        correctAnswer,
        difficult: userCookie.difficult,
      });
      return finalScore;
    }
    case "Platinum": {
      const finalScore = getFinalScore({
        minCorrectAnswer: 8,
        k: 3,
        correctAnswer,
        difficult: userCookie.difficult,
      });
      return finalScore;
    }
    case "Master": {
      const finalScore = getFinalScore({
        minCorrectAnswer: 9,
        k: 4,
        correctAnswer,
        difficult: userCookie.difficult,
      });
      return finalScore;
    }

    default:
      return 0;
  }
};

const getFinalScore = ({ minCorrectAnswer, k, correctAnswer, difficult }) => {
  const answerValid = correctAnswer - minCorrectAnswer;
  let finalScore = answerValid * (k + difficult) * 10;
  console.log("final score", finalScore);
  // if (finalScore < 0) finalScore = 0;
  return finalScore;
};

const saveRoomMember = async (data) => {
  const { userCookie, finalScore, roomId, correctAnswer } = data;
  console.log("75", typeof roomId, roomId, typeof correctAnswer, correctAnswer);

  await conn
    .promise()
    .query(
      `INSERT INTO room_member (id_room,id_user,score,correct_answer) VALUES (${roomId},${userCookie.id},${finalScore},${correctAnswer})`
    );
};
