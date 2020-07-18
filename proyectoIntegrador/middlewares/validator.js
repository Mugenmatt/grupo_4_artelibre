const path = require('path');
const { body } = require('express-validator');
const db= require('../database/models/')
const Op = db.Sequelize.Op
const User = db.User;

module.exports ={
    register: [
        body('name')
            .notEmpty().withMessage('Campo obligatorio'),
        body('username')
        .notEmpty().withMessage('Campo obligatorio').bail()
        .custom(value => {

            return User.findOne({
               where: {
                  username: value
               }
            })
               .then(user => {
                  if(user){
                     return Promise.reject('El username ya está registrado')
                  }
               })

         }),
        body('email')
         .notEmpty().withMessage('Campo obligatorio').bail()
         .isEmail().withMessage('Debes ingresar un email válido').bail()
         .custom(value => {

            return User.findOne({
               where: {
                  email: value
               }
            })
               .then(user => {
                  if (user) {
                     return Promise.reject('El email ya está registrado')
                  }
               })

         }),
        body('password')
         .notEmpty().withMessage('Campo obligatorio').bail()
         .isLength({ min: 3 }).withMessage('La contraseña debe tener al menos 3 caracteres'),
        body('password2')
         .notEmpty().withMessage('Campo obligatorio').bail()
         .custom((value, { req }) => req.body.password == req.body.password2).withMessage('Las contraseñas no coinciden')

            ],
    editUser:[
        body('username')
        .notEmpty().withMessage('Campo obligatorio').bail()
        .custom((value, {req}) => {

            return User.findOne({
               where: {
                  username: value,
                  id:{[Op.ne]:req.session.user.id}
               }
            })
               .then(user => {
                  if(user){
                     return Promise.reject('El username ya está registrado')
                  }
               })

         }),

        body('avatar')
         .custom((value, { req }) => {

            if(req.file != undefined){
               const acceptedExtensions = ['.jpg', '.jpeg', '.png', '.PNG'];
               const ext = path.extname(req.file.originalname)
               return acceptedExtensions.includes(ext);
            }

            return true
            
         }).withMessage('La imagen debe tener uno de los siguientes formatos: JPG, JPEG, PNG')
    ],
    createProduct:[
         body('name')
            .notEmpty().withMessage('Campo obligatorio'),
         body('price')
            .notEmpty().withMessage('Campo obligatorio'),
         body('ancho')
            .notEmpty().withMessage('Campo obligatorio'),
         body('alto')
            .notEmpty().withMessage('Campo obligatorio'),
         body('quantity')
            .notEmpty().withMessage('Campo obligatorio'),
         body('imageFile')
            .custom((value, { req }) => req.file).withMessage('Debes ingresar una imagen para tu producto').bail()
            .custom((value,{req}) =>{
               
               if(req.file != undefined){
                  const acceptedExtensions = ['.jpg', '.jpeg', '.png', '.PNG'];
                  const ext = path.extname(req.file.originalname)
                  return acceptedExtensions.includes(ext);
               }
               return true
               
            }).withMessage('La imagen debe tener uno de los siguientes formatos: JPG, JPEG, PNG'),
         // body('status')
         //    .notEmpty().withMessage('Campo obligatorio')
            
    ],
    editProduct:[
         body('name')
            .notEmpty().withMessage('Campo obligatorio'),
         body('price')
            .notEmpty().withMessage('Campo obligatorio'),
         body('ancho')
            .notEmpty().withMessage('Campo obligatorio'),
         body('alto')
            .notEmpty().withMessage('Campo obligatorio'),
         body('quantity')
            .notEmpty().withMessage('Campo obligatorio'),
         body('imageFile')
            .custom((value, { req }) => req.file).withMessage('Debes ingresar una imagen para tu producto').bail()
            .custom((value,{req}) =>{
               
               if(req.file != undefined){
                  const acceptedExtensions = ['.jpg', '.jpeg', '.png', '.PNG'];
                  const ext = path.extname(req.file.originalname)
                  return acceptedExtensions.includes(ext);
               }
               return true
               
            }).withMessage('La imagen debe tener uno de los siguientes formatos: JPG, JPEG, PNG'),
         // body('status')
         //    .notEmpty().withMessage('Campo obligatorio')
    ],
    newAdress: [
      body('province')
         .notEmpty().withMessage('Campo obligatorio'),
      body('city')
         .notEmpty().withMessage('Campo obligatorio'),
      body('street')
         .notEmpty().withMessage('Campo obligatorio'),
      body('number')
         .notEmpty().withMessage('Campo obligatorio'),
      body('cp')
         .notEmpty().withMessage('Campo obligatorio')
    ],
    editAdress: [
      body('province')
         .notEmpty().withMessage('Campo obligatorio'),
      body('city')
         .notEmpty().withMessage('Campo obligatorio'),
      body('street')
         .notEmpty().withMessage('Campo obligatorio'),
      body('number')
         .notEmpty().withMessage('Campo obligatorio'),
      body('cp')
         .notEmpty().withMessage('Campo obligatorio')
    ],
}