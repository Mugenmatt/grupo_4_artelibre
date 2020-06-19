const express = require('express');
const router = express.Router();
const usersController = require('../controllers/usersController');
const multer = require("multer");
const path = require('path');
const { check, validationResult, body} = require('express-validator');

// Middlewares
const guestMiddleware = require('../middlewares/guestMiddleware'); //Esto te deja acceder solo si sos invitado
const authMiddleware = require('../middlewares/authMiddleware'); //Esto te deja acceder solo si sos usuario

router.get('/register', guestMiddleware,usersController.register);
router.post('/register',usersController.processRegister);
router.get('/login', authMiddleware,usersController.login);
router.post('/login', [
    check('username').isEmail().withMessage('El usuario debe ser un email'),
    check('password').isLength({min:8}).withMessage('La contraseña debe tener al menos 8 caracteres')
],usersController.processLogin);

module.exports = router;