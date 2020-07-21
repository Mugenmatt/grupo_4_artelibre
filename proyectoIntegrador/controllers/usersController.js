const bcryptjs = require('bcryptjs');
const {validationResult} = require('express-validator');
const {User, Adress, Product, Cartitem}= require('../database/models/')
const fs = require('fs')
const path = require('path')

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
                include: {
                  all: true,
                  nested: true
                }
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
                include: {
                  all: true,
                  nested: true
                }
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
                include: {
                  all: true,
                  nested: true
                }
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

        const errors = validationResult(req);
        

        if (errors.isEmpty()) {
            
            let productoACrear={
                name: req.body.name,
                description: req.body.description,
                price: req.body.price,
                quantity: req.body.quantity,
                ancho: req.body.ancho,
                alto: req.body.alto,
                status: req.body.status,
                idUser: usuarioEnSesion.id,
                imageFile: req.file ? req.file.filename : null,
            }
    
    
            Product.create(productoACrear)
            .then(()=>{
                return res.redirect('/users/profile/myart')
            })
            .catch(errors=> console.log(errors))
        }else{

            User.findByPk(usuarioEnSesion.id, {
                include: ["products"]
            }).then(user=>{
                return res.render('myart',{user, errors: errors.mapped(), old:req.body});
            })
            .catch(errors=> console.log(errors))
        }


    },

    deleteMyart: function(req,res){
        let productId = req.body.productId;

        Product.findByPk(productId)
        .then(producto =>{
            let filePath = path.join(__dirname, '..','public','images','products',producto.imageFile)
            fs.unlinkSync(filePath)
        })
        .then(()=>{
            Product.destroy({
                where: {
                    id: productId
                }
            })
            .then(()=>{
    
                return res.redirect("/users/profile/myart")
            })
            .catch(errors=> console.log(errors))

        }).catch(errors=> console.log(errors))


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

        const errors = validationResult(req);
        
        if (errors.isEmpty()) {

            Product.findByPk(productId)
            .then(producto =>{
                let filePath = path.join(__dirname, '..','public','images','products',producto.imageFile)
                if (req.file && producto.imageFile != req.file.filename) {
                    fs.unlinkSync(filePath)
                }
                return producto;
            })
            .then((producto)=>{
                Product.update({
                    name: req.body.name,
                    description: req.body.description,
                    price: req.body.price,
                    ancho: req.body.ancho,
                    alto: req.body.alto,
                    quantity: req.body.quantity,
                    status: req.body.status, 
                    imageFile: req.file ? req.file.filename : producto.imageFile,
                    },
                    {where: 
                        {id: productId} 
                    })
                .then((product)=>{
                    return res.redirect("/users/profile/myart")
                })
                .catch(errors=> console.log(errors))
            })
            .catch(errors=> console.log(errors))
        }else{
            Product.findByPk(productId)
                .then((product)=>{
                    return res.render("edit-myart",{product, errors: errors.mapped(), old:req.body})
                })
                .catch(errors=> console.log(errors))
        }


    },

    showMyorders: function (req, res) {

        let usuarioEnSesion = req.session.user;

        Cartitem.findAll({
            where: {
                idSeller: usuarioEnSesion.id
            },
            include: {
                all:true
            }
        })
        .then(items=>{
            return res.render('myorders',{items})
        })
        .catch(errors => console.log(errors))

        

    },


}
module.exports = usersController; 