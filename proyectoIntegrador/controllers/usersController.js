const bcryptjs = require('bcryptjs');
const { check, validationResult, body} = require('express-validator');
const db= require('../database/models/')
const User = db.User;

const usersController ={
    register: function(req,res){
        return res.render('register');
    },

    processRegister: function(req,res){
        let user = req.body;

        user.password = bcryptjs.hashSync(user.password,10);
        delete user.password2;

        User.create(user)
        .then(()=>{
            return res.redirect('/users/login');
        })
        .catch((error)=>{
            console.log(error);
            
        })

    },
    
    login: function(req,res){
        return res.render('login');
    },

    processLogin: function(req,res){

        User.findOne({
            where: {
               email: req.body.email
            }
         })
            .then(user => {
   
               if(user){
                  if(bcryptjs.compareSync(req.body.password, user.password)){
                     let userSession = user;
   
                     delete userSession.password;
   
                     req.session.user = userSession;
   
                     return res.redirect('/');
   
                  } else {
                    return res.render('login',{error:'Usuario y/o contraseña no coinciden'})
                  }
               } else {
                return res.render('login',{error:'Usuario y/o contraseña no coinciden'})
               }
            })
       

    }

}
module.exports = usersController; 