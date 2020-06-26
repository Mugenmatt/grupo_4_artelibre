const express = require('express');
const router = express.Router();
const productController = require('../controllers/productController')


router.get('/:id', productController.index)

module.exports = router;
