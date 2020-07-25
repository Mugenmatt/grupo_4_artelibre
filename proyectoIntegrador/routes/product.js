const express = require('express');
const router = express.Router();
const productController = require('../controllers/productController')
const authMiddleware = require('../middlewares/authMiddleware');


router.get('/:id', productController.index)
router.post('/comentar',authMiddleware ,productController.comentar)
router.post('/responder',authMiddleware ,productController.responder)

module.exports = router;
