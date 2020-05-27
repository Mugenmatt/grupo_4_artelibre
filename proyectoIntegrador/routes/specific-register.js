const express = require('express');
const router = express.Router();
const specificRegisterController = require('../controllers/specificRegisterController')
const multer = require("multer")
const path = require('path')

// codigo para guardar imagen de usuario
let storage = multer.diskStorage({
    destination: function (req, file, cb) {
        cb(null, 'tmp/my-uploads')
    },
    filename: function (req, file, cb) {
        cb(null, file.fieldname + '-' + Date.now() + path.extname(file.originalname))
    }
})

let upload = multer({
    storage: storage
})


router.get('/', specificRegisterController.index)

module.exports = router;