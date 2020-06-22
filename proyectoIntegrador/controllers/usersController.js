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
        // Matias dijo: "Creo que esto era del JSON model, pero como no estoy seguro lo dejo comentado"
        // const user = userModel.findBySomething(e=> e.username == req.body.username)
        // if(user){
        //     if (bcryptjs.compareSync(req.body.password, user.password)) {
        //         return res.send('Te haz logueado con exito');
        //     } 
        // }
        // return res.send('El usuario y la contraseña no coinciden :(')

        // Matias dijo: "Me guié del video de Session de Playground"

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


        // let errors = validationResult(req);

        // if(errors.isEmpty()) {

        //     let dbUsuarios = fs.readFileSync('', {});
        //     let users;
        //     if(dbUsuarios == "") {
        //         users = [];
        //     } else {
        //         users = JSON.parse(dbUsuarios)
        //     }

        //     for(let i = 0; i < users.length; i++) {
        //         if(users[i].email == req.body.email) {
        //             if(bcryptjs.compareSync(req.body.password, users[i].password)) {
        //                 let usuarioALoguearse = users[i];
        //                 break;
        //             }
        //         }
        //     }

        //     if(usuarioALoguearse == undefined) {
        //         return res.render('login', {errors: 
        //             [{msg:'Credenciales invalidas'}]
        //         })
        //     }

        //     req.session.usuarioLogueado = usuarioALoguearse;
        //     res.redirect('index');

        // } else {
        //     return res.render('login', {errors:errors.errors})
        // }

    }

}
module.exports = usersController; 