const { conn } = require("../data/connect");

exports.updateRank = (io, socket, data) => {
  console.log(data);

  //
  const { userCookie, currentScore } = data;

  checkRank({ userCookie, currentScore });
  //   checkCurrentScore()
};

const checkRank = ({ userCookie, currentScore }) => {
  let newTotalScore = null;
  let sum = userCookie.total_score + currentScore;
  let difference = userCookie.total_score - currentScore;

  switch (userCookie.level) {
    case "Copper": {
      if (currentScore >= 5)
        return (newTotalScore = userCookie.total_score + currentScore);
      if (difference < 0) return 0;
      return newTotalScore;
    }
    case "Silver": {
      break;
    }
    case "Gold": {
      break;
    }
    case "Platinum": {
      break;
    }
    case "Master": {
      break;
    }

    default:
      break;
  }
};
