const fs = require('fs')
const path = require('path')
const {User, Product}= require('../database/models/')
const {validationResult} = require('express-validator');


const myartController = {
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
            // fs.unlinkSync(filePath)
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
                    // fs.unlinkSync(filePath)
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


    }
}

module.exports= myartController;