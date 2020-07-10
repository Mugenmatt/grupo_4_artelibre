const path = require('path');
const { body } = require('express-validator');
const db= require('../database/models/')
const User = db.User;

module.exports ={
    register: [
        body('name')
            .notEmpty().withMessage('Campo obligatorio'),
        body('username')
        .notEmpty().withMessage('Campo obligatorio').bail()
        // .custom(value=>{
            //ckeckear si el usuario ya existe.
        // })
            ],
    editUser:[],
    createProduct:[
        body('name')
            .notEmpty().withMessage('Campo obligatorio')
    ],
    editProduct:[
        body('name')
            .notEmpty().withMessage('Campo obligatorio')
    ],
}