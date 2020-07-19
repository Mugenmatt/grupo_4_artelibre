const express = require('express');
const router = express.Router();
const cartController = require('../controllers/cartController')
const authMiddleware = require('../middlewares/authMiddleware');

router.get('/',authMiddleware, cartController.index)
router.post('/',authMiddleware, cartController.agregarAlCarrito)
router.delete('/',authMiddleware, cartController.eliminarDelCarrito)

router.post('/purchase',authMiddleware, cartController.efectuarCompra)

module.exports = router;
