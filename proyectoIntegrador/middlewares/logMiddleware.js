const db= require('../database/models/')
const User = db.User;

module.exports = function(req,res,next){

    res.locals.user=false;
    req.cookies.id;

    if (req.session.user) {
        res.locals.user= req.session.user;
        return next();
    } else if (req.cookies.id) {
        User.findByPk(req.cookies.id)
        .then(function(user){
            if (user) {
                let usuario=user;
                delete usuario.password;
                delete usuario.password2;

                req.session.user = usuario;
                res.locals.user = usuario;
            }
            return next();
        }).catch( errors=>console.log(errors) )
    }else{
        return next();
    }

}