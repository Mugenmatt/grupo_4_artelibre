const express = require('express');
const router = express.Router();
const usersController = require('../controllers/usersController');
const multer = require("multer");
const path = require('path');


// Middlewares
const guestMiddleware = require('../middlewares/guestMiddleware');
const authMiddleware = require('../middlewares/authMiddleware');
const validator = require('../middlewares/validator');

// Usuarios
// ************  Multer Config  ***************
let storage = multer.diskStorage({
    destination: function (req, file, cb) {
          cb(null, path.resolve(__dirname, '../public/images/users'))
    },
    filename: function (req, file, cb) {
          cb(null, file.fieldname + '-' + Date.now() + path.extname(file.originalname))
    }
})
 
let upload = multer({
    storage: storage,
 
    // Validate image
    fileFilter: (req, file, cb) => {
       
       const acceptedExtensions = ['.jpg', '.jpeg', '.png', '.PNG'];
 
       const ext = path.extname(file.originalname);
 
       if (!acceptedExtensions.includes(ext)){
             req.file = file;
       }
          
       cb(null, acceptedExtensions.includes(ext));
    }
});

// Productos

let storage2 = multer.diskStorage({
      destination: function (req, file, cb) {
            cb(null, path.resolve(__dirname, '../public/images/products'))
      },
      filename: function (req, file, cb) {
            cb(null, file.fieldname + '-' + Date.now() + path.extname(file.originalname))
      }
  })
   
  let upload2 = multer({
      storage: storage2,
   
      // Validate image
      fileFilter: (req, file, cb) => {
         
         const acceptedExtensions = ['.jpg', '.jpeg', '.png', '.PNG'];
   
         const ext = path.extname(file.originalname);
   
         if (!acceptedExtensions.includes(ext)){
               req.file = file;
         }
            
         cb(null, acceptedExtensions.includes(ext));
      }
  });

//rutas

router.get('/register', guestMiddleware,usersController.register);
router.post('/register',validator.register, usersController.processRegister);
router.get('/login', guestMiddleware,usersController.login);
router.post('/login',usersController.processLogin);

router.post('/logout',authMiddleware, usersController.logout);

router.get('/profile',authMiddleware, usersController.profile);
router.put('/profile',authMiddleware, upload.single('avatar'), validator.editUser, usersController.profileEdit);
router.delete('/profile',authMiddleware, usersController.profileDelete);

router.post('/profile',authMiddleware,validator.newAdress ,usersController.profileNewAdress);
router.delete('/profile/adress',authMiddleware, usersController.profileDeleteAdress);

router.get('/profile/myart', authMiddleware, usersController.showMyart );
router.post('/profile/myart', authMiddleware, upload2.single('imageFile'),validator.createProduct, usersController.createMyart );
router.delete('/profile/myart', authMiddleware, usersController.deleteMyart );
router.get('/profile/myart/:id', authMiddleware,usersController.editMyart );
router.put('/profile/myart/:id', authMiddleware, upload2.single('imageFile'),validator.editProduct ,usersController.processEditMyart );

router.get('/profile/myorders', authMiddleware, usersController.showMyorders);

module.exports = router;