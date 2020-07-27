function rolMiddleware(req, res, next) {

    if(req.session.user.rol==1) {
        return next();
    } else {
        return res.redirect('/users/profile')
    }

}

module.exports = rolMiddleware;