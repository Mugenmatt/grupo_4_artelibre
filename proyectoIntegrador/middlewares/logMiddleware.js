const db= require('../database/models/')
const User = db.User;

module.exports = function(req,res,next){

    res.locals.user=false;
    req.cookies.id;

    if (req.session.user) {
        User.findByPk(req.session.user.id)
        .then(function(user){
            if (user) {
                let usuario=user;
                delete usuario.dataValues.password;

                req.session.user = usuario;
                res.locals.user = usuario;
            }
            return next();
        }).catch( errors=>console.log(errors) )

    } else if (req.cookies.id) {
        User.findByPk(req.cookies.id)
        .then(function(user){
            if (user) {
                let usuario=user;
                delete usuario.dataValues.password;

                req.session.user = usuario;
                res.locals.user = usuario;
            }
            return next();
        }).catch( errors=>console.log(errors) )
    }else{
        return next();
    }

}