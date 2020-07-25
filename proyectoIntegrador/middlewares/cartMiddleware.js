const {Cartitem}= require('../database/models/')

module.exports= function(req,res,next){

    if (req.session.user) {

        return Cartitem.count({
            where: {
                idUser: req.session.user.id,
                status: 0
            }
        })
        .then(cantidad=>{
            res.locals.cantItems = cantidad;

            return next()
        })

    }else{
        return next()
    }
}