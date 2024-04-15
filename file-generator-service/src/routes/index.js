const express = require('express');
const baseRoute = require('./baseRoute');

const router = express.Router();

router.use('/health', baseRoute);

module.exports = router;
