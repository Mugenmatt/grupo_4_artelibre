const express = require('express');
const router = express.Router();
const usersController = require('../controllers/usersController');
const multer = require("multer");
const path = require('path');


// Middlewares
const guestMiddleware = require('../middlewares/guestMiddleware'); //Esto te deja acceder solo si sos invitado
const authMiddleware = require('../middlewares/authMiddleware'); //Esto te deja acceder solo si sos usuario
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

//agregarle validator al de aca abajo
router.post('/profile/adress/new',authMiddleware, usersController.profileNewAdress);
//agregarle validator al de aca abajo
router.put('/profile/adress/:id',authMiddleware, usersController.profileEditAdress);
router.delete('/profile/adress/:id',authMiddleware, usersController.profileDeleteAdress);

router.get('/profile/myart', authMiddleware, usersController.showMyart );
//agregarle validator al de aca abajo
router.post('/profile/myart', authMiddleware, upload2.single('imageFile'), usersController.createMyart );
router.delete('/profile/myart/:id', authMiddleware, usersController.deleteMyart );
router.get('/profile/myart/:id', authMiddleware,usersController.editMyart );
//agregarle validator al de aca abajo
router.put('/profile/myart/:id', authMiddleware, upload2.single('imageFile') ,usersController.processEditMyart );

router.get('/profile/myorders', authMiddleware, usersController.showMyorders);

module.exports = router;