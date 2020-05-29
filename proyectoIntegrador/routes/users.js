const express = require('express');
const router = express.Router();
const usersController = require('../controllers/usersController');
const multer = require("multer");
const path = require('path');

router.get('/register',usersController.register);
router.post('/register',usersController.processRegister);
router.get('/login',usersController.login);
router.post('/login',usersController.processLogin);

module.exports = router;