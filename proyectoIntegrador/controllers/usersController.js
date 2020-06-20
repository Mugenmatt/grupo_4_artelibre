const bcryptjs = require('bcryptjs');
const { check, validationResult, body} = require('express-validator');
const db= require('../database/models/')
const Usuario = db.Usuario;

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
        // Matias dijo: "Creo que esto era del JSON model, pero como no estoy seguro lo dejo comentado"
        // const user = userModel.findBySomething(e=> e.username == req.body.username)
        // if(user){
        //     if (bcryptjs.compareSync(req.body.password, user.password)) {
        //         return res.send('Te haz logueado con exito');
        //     } 
        // }
        // return res.send('El usuario y la contraseña no coinciden :(')

        // Matias dijo: "Me guié del video de Session de Playground"

        let errors = validationResult(req);

        if(errors.isEmpty()) {

            let dbUsuarios = fs.readFileSync('', {});
            let users;
            if(dbUsuarios == "") {
                users = [];
            } else {
                users = JSON.parse(dbUsuarios)
            }

            for(let i = 0; i < users.length; i++) {
                if(users[i].email == req.body.email) {
                    if(bcryptjs.compareSync(req.body.password, users[i].password)) {
                        let usuarioALoguearse = users[i];
                        break;
                    }
                }
            }

            if(usuarioALoguearse == undefined) {
                return res.render('login', {errors: 
                    [{msg:'Credenciales invalidas'}]
                })
            }

            req.session.usuarioLogueado = usuarioALoguearse;
            res.redirect('index');

        } else {
            return res.render('login', {errors:errors.errors})
        }

    }

}
module.exports = usersController; 