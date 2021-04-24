const { conn } = require("../data/connect");

exports.updateRank = async (io, socket, data) => {
  console.log("Welcome to rank", data);

  //
  const { userCookie, roomId } = data;

  const newTotalScore = await getNewTotalScore({ userCookie, roomId });
  console.log("10", newTotalScore);
  const newRank = await getNewRank(newTotalScore);
  console.log("12", newRank);

  await finalUpdate({ userCookie, newTotalScore, newRank });
  console.log("update rank success");
};

const getNewTotalScore = async ({ userCookie, roomId }) => {
  let lastestScore;
  let totalScore;
  let newTotalScore;

  const getLastestScore = (rows) => {
    lastestScore = rows.score;
  };

  const getTotalScore = (rows) => {
    totalScore = rows.total_score;
  };

  const getNewTotalScore = () => {
    newTotalScore = totalScore + lastestScore;
    console.log("newTotalScore", newTotalScore);
  };

  await conn
    .promise()
    .query(
      `SELECT score FROM room_member WHERE id_user=${userCookie.id} ORDER BY id_room DESC LIMIT 1`
    )
    .then(([rows]) => {
      console.log("24", rows);
      getLastestScore(rows[0]);
    });

  await conn
    .promise()
    .query(`SELECT total_score FROM user WHERE id=${userCookie.id}`)
    .then(async ([rows]) => {
      console.log("24", rows);
      await getTotalScore(rows[0]);
      await getNewTotalScore();
    });

  return newTotalScore;
};

const getNewRank = (newScore) => {
  console.log("40", typeof newScore, newScore);
  newScore = parseInt(newScore);
  console.log("42", typeof newScore, newScore);

  if (newScore < 500) return "Bronze";
  if (newScore >= 500 && newScore < 1000) return "Silver";
  if (newScore >= 1000 && newScore < 1500) return "Gold";
  if (newScore >= 1500 && newScore < 2000) return "Platinum";
  if (newScore >= 2000) return "Master";
};

const finalUpdate = async ({ userCookie, newTotalScore, newRank }) => {
  console.log(
    "50",
    typeof newTotalScore,
    newTotalScore,
    typeof newRank,
    newRank
  );
  await conn
    .promise()
    .query(
      `UPDATE user SET total_score = ${parseInt(
        newTotalScore
      )}, level="${newRank}" WHERE id=${userCookie.id}`
    )
    .then(([rows]) => {
      console.log("24", rows);
    });
};
