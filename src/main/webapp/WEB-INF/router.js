const express = require("express");
const router = express.Router();

router.use("/website-trac-nghiem", (req, res) => {
  res.render("lobby");
});

module.exports = router;
