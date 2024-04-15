const express = require('express');
const { getHealthData } = require('../controllers/baseController');

const router = express.Router();

router.get('/', getHealthData);

module.exports = router;
