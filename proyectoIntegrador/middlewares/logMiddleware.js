module.exports = function(req,res,next){

    let user= req.session.user;
    res.locals.user=false;

    if (user) {
        res.locals.user= user;
    }

    return next();

}