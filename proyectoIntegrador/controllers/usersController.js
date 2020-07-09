const bcryptjs = require('bcryptjs');
const { check, validationResult, body} = require('express-validator');
const db= require('../database/models/')
const User = db.User;
const Adress = db.Adress;
const Product = db.Product;

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

        // User.findByPk(usuarioEnSesion.id)
        //     .then(user => {
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
            // })
        

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

    },

    profileEditAdress: function(req,res){
        let adressId= req.params.id;

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

    },

    profileDeleteAdress: function(req,res){
        let adressId= req.params.id;

        Adress.destroy(
        {where: 
            {id: adressId} 
        })
        .then(function(){
            return res.redirect('/users/profile')
        })
        .catch(errors=> console.log(errors))

    },

    showMyart: function(req,res){
        let usuarioEnSesion= req.session.user;

        User.findByPk(usuarioEnSesion.id, {
            include: ["products"]
        }).then(user=>{
            return res.render('myart',{user});
        })
        .catch(errors=> console.log(errors))

    },
    
    createMyart: function(req,res){
        let usuarioEnSesion= req.session.user;

        let productoACrear={
            name: req.body.name,
            description: req.body.description,
            price: req.body.price,
            quantity: req.body.quantity,
            ancho: req.body.ancho,
            alto: req.body.alto,
            //status: req.body.status
            idUser: usuarioEnSesion.id,
            imageFile: req.file ? req.file.filename : null,
        }

        // Product.setkeywords()

        Product.create(productoACrear)
        .then(()=>{
            return res.redirect('/users/profile/myart')
        })
        .catch(errors=> console.log(errors))

    },

    deleteMyart: function(req,res){
        let productId = req.params.id;

        Product.destroy({
            where: {
                id: productId
            }
        })
        .then(()=>{
            return res.redirect("/users/profile/myart")
        })
        .catch(errors=> console.log(errors))

    },

    editMyart: function(req,res){
        let productId = req.params.id;

        Product.findByPk(productId)
        .then((product)=>{
            return res.render("edit-myart",{product})
        })
        .catch(errors=> console.log(errors))

    },

    processEditMyart: function(req,res){
        let productId = req.params.id;

        Product.update({
            name: req.body.name,
            description: req.body.description,
            price: req.body.price,
            ancho: req.body.ancho,
            alto: req.body.alto,
            quantity: req.body.quantity,
            status: req.body.status, 
            imageFile: req.file ? req.file.filename : null,
            },
            {where: 
                {id: productId} 
            })
        .then((product)=>{
            return res.redirect("/users/profile/myart")
        })
        .catch(errors=> console.log(errors))

    },

    showMyorders: function (req, res) {

        let usuarioEnSesion = req.session.user;

        User.findByPk(usuarioEnSesion.id, {
                include: ["products"]
            }).then(user => {
                return res.render('myorders', {
                    user
                });
            })
            .catch(errors => console.log(errors))

    },


}
module.exports = usersController; 