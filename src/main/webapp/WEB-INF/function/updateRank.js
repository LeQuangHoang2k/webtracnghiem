const { conn } = require("../data/connect");

exports.updateRank = async (io, socket, data) => {
  console.log("Welcome to rank", data);

  //
  const { userCookie, roomId } = data;

  const newScore = await getNewScore({ userCookie, roomId });
  console.log("10", newScore);
  const newRank = await getNewRank(newScore);
  console.log("12", newRank);

  await finalUpdate({ userCookie, newScore, newRank });
  console.log("update rank success");
};

const getNewScore = async ({ userCookie, roomId }) => {
  let newScore;

  const getResult = (rows) => {
    newScore = rows.sum;
  };
  await conn
    .promise()
    .query(
      `SELECT sum(score) as sum FROM room_member WHERE id_user=${userCookie.id}`
    )
    .then(([rows]) => {
      console.log("24", rows);
      getResult(rows[0]);
    });

  return newScore;
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

const finalUpdate = async ({ userCookie, newScore, newRank }) => {
  console.log("50", typeof newScore, newScore, typeof newRank, newRank);
  await conn
    .promise()
    .query(
      `UPDATE user SET total_score = ${parseInt(newScore)}, level="${newRank}" WHERE id=${userCookie.id}`
    )
    .then(([rows]) => {
      console.log("24", rows);
    });
};
