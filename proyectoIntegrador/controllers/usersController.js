const bcryptjs = require('bcryptjs');
const {validationResult} = require('express-validator');
const {User, Adress, Cartitem, Order}= require('../database/models/')


const usersController ={
    register: function(req,res){
        return res.render('register');
    },

    processRegister: function(req,res){
        const errors = validationResult(req);
        
        if (errors.isEmpty()) {
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
            
        }else{
            return res.render('register',{errors: errors.mapped() , old:req.body})
        }


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
   
                    delete userSession.dataValues.password;
                    
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
            include: ['adresses']
          }).then(function(user){
              return res.render('profile',{user})
          })

    },

    profileEdit: function(req,res){

        let usuarioEnSesion= req.session.user;
        const errors = validationResult(req);
        if (errors.isEmpty()) {
    
            User.update(
                {username: req.body.username,
                avatar: req.file ? req.file.filename : usuarioEnSesion.avatar,
                rol: req.body.rol? 1 : 0,
                noShipping: req.body.noShipping ? 1 : 0,
                mailShipping: req.body.mailShipping ? 1 : 0,
                privateShipping: req.body.privateShipping ? 1 : 0
                },
                {where: 
                    {id: usuarioEnSesion.id} 
                }
            ).then(()=>{
                
                return res.redirect("/users/profile")
            }).catch(errors=> console.log(errors))
            
        }else{
            User.findByPk(usuarioEnSesion.id,{
                include: ['adresses']
              }).then(function(user){
                  return res.render('profile',{user, errors: errors.mapped(), old:req.body})
              })
        }
        

    },

    profileDelete: function(req,res){
        let usuarioEnSesion= req.session.user;

        User.destroy(
            {where: {
                id:usuarioEnSesion.id
                }
            })
        .then(function(user){
            req.session.destroy();
        
            if (req.cookies.id) {
                res.clearCookie("id");
            }
            return res.redirect('/')
          }).catch(errors=> console.log(errors))

    },

    profileNewAdress: function(req,res){
        let usuarioEnSesion= req.session.user;
        const errors = validationResult(req);
        
        if (errors.isEmpty()) {
            Adress.create({
                street: req.body.street ,
                number: req.body.number , 
                floor: req.body.floor ,
                door: req.body.door ,
                cp: req.body.cp , 
                province: req.body.province , 
                city: req.body.city ,
                idUser: usuarioEnSesion.id
            })
            .then(function(){
                return res.redirect('/users/profile')
            })
            .catch(errors=> console.log(errors))

        }else{
            User.findByPk(usuarioEnSesion.id,{
                include: ['adresses']
              }).then(function(user){
                  return res.render('profile',{user, adressErrors: errors.mapped(), oldAdress:req.body})
              })
        }


    },

    profileEditAdress: function(req,res){
        let usuarioEnSesion= req.session.user;
        let adressId= req.params.id;

        const errors = validationResult(req);
        
        if (errors.isEmpty()) {

            Adress.update({
                street: req.body.street ,
                number: req.body.number , 
                floor: req.body.floor ,
                door: req.body.door ,
                cp: req.body.cp , 
                province: req.body.province , 
                city: req.body.city ,
            },
            {where: 
                {id: adressId} 
            })
            .then(function(){
                return res.redirect('/users/profile')
            })
            .catch(errors=> console.log(errors))
        }else{
            
            User.findByPk(usuarioEnSesion.id,{
                include: ['adresses']
              }).then(function(user){
                  return res.render('profile',{user, adressErrors: errors.mapped(), oldAdress:req.body})
              })
        }


    },

    profileDeleteAdress: function(req,res){
        let adressId= req.body.adressId;

        Adress.destroy(
        {where: 
            {id: adressId} 
        })
        .then(function(){
            return res.redirect('/users/profile')
        })
        .catch(errors=> console.log(errors))

    },

    

    showMisventas: function (req, res) {

        let usuarioEnSesion = req.session.user;

        Cartitem.findAll({
            where: {
                idSeller: usuarioEnSesion.id
            },
            
            include: {
                all:true,
                paranoid: false
            }
        })
        .then(items=>{
            return res.render('misventas',{items})
        })
        .catch(errors => console.log(errors))

        

    },

    showMiscompras: function (req, res) {

        let usuarioEnSesion = req.session.user;

        Order.findAll({
            where: {
                userId: usuarioEnSesion.id
            },
            
            include: {
                all:true,
                paranoid: false
            }
        })
        .then(ordenes=>{
            return res.render('miscompras',{ordenes})
        })
        .catch(errors => console.log(errors))

    },


}
module.exports = usersController; 