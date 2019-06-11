"use strict";

const express = require("express");
const app = express();
const router = express.Router();

function fib(n) {
  if (n > 1) {
    return fib(n - 1) + fib(n - 2);
  } else {
    return n;
  }
}

app.use(
  "/bench",
  router.get("/", async (req, res, next) => {
    res.status(200).send({
      message: fib(15)
    });
  })
);

module.exports = app;
