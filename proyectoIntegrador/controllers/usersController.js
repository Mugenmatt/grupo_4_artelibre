const bcryptjs = require('bcryptjs');
const jsonModel = require('../models/jsonModel');
const userModel = jsonModel('usuarios');

const usersController ={
    register: function(req,res){
        return res.render('register');
    },

    processRegister: function(req,res){

        req.body.password = bcryptjs.hashSync(req.body.password,10);
        delete req.body.password2;

        let nuevoUsuario={
            id:userModel.nextId(),
            ...req.body
        }

        userModel.save(nuevoUsuario);

        return res.redirect('/users/login');
    },
    
    login: function(req,res){
        return res.render('login');
    },

    processLogin: function(req,res){
        const user = userModel.findBySomething(e=> e.username == req.body.username)
        if(user){
            if (bcryptjs.compareSync(req.body.password, user.password)) {
                return res.send('Te haz logueado con exito');
            } 
        }
        return res.send('El usuario y la contraseña no coinciden :(')
    }

}
module.exports = usersController; 