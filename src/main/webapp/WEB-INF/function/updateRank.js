const { conn } = require("../data/connect");

exports.updateRank = (io, socket, data) => {
  console.log("Welcome to rank", data);

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
      if (currentScore >= 6)
        return (newTotalScore = userCookie.total_score + currentScore);
      if (difference < 0) return 0;
      return newTotalScore;
    }
    case "Gold": {
      if (currentScore >= 7)
        return (newTotalScore = userCookie.total_score + currentScore);
      if (difference < 0) return 0;
      return newTotalScore;
    }
    case "Platinum": {
      if (currentScore >= 8)
        return (newTotalScore = userCookie.total_score + currentScore);
      if (difference < 0) return 0;
      return newTotalScore;
    }
    case "Master": {
      if (currentScore >= 9)
        return (newTotalScore = userCookie.total_score + currentScore);
      if (difference < 0) return 0;
      return newTotalScore;
    }

    default:
      break;
  }
};
