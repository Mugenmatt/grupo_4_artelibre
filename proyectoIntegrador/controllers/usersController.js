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
        console.log(user);

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
                     delete userSession.password2;
   
                     req.session.user = userSession;

                     if (req.body.recordar) {
                         res.cookie("id",userSession.id,{maxAge: 1000 * 60 * 60 * 24 })
                     }
   
                     return res.redirect('/');
   
                  } else {
                    return res.render('login',{error:'Usuario y/o contraseña no coinciden'})
                  }
               } else {
                return res.render('login',{error:'Usuario y/o contraseña no coinciden'})
               }
            })
       

    },
    logout: function(req,res){
        req.session.destroy();
        
        if (req.cookies.id) {
            res.clearCookie("id");
        }

        return res.redirect('/')
    },

    profile: function(req,res){
        let usuarioEnSesion= req.session.user;

        User.findByPk(usuarioEnSesion.id,{
            include: {
              all: true,
              nested: true
            }
          }).then(function(user){
              return res.render('profile',{user})
          })

    },

    profileEdit: function(req,res){
        let usuarioEnSesion= req.session.user;

        User.update(
            {username: req.body.username,
            avatar: req.file ? req.file.filename : null,
            rol: req.body.rol,
            noShipping: req.body.noShipping,
            mailShipping: req.body.mailShipping,
            privateShipping: req.body.privateShipping
            },
            {where: 
                {id: usuarioEnSesion.id} 
            }
        ).then(()=>{
            return res.redirect("/profile")
        }).catch(errors=> console.log(errors))

    },

    profileDelete: function(req,res){
        let usuarioEnSesion= req.session.user;

        User.findByPk(usuarioEnSesion.id,{
            include: {
              all: true,
              nested: true
            }
          }).then(function(user){
              return res.render('profile',{user})
          })

    },

}
module.exports = usersController; 