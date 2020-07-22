function authMiddleware(req, res, next) {

    if(req.session.user != undefined) {
        return next();
    } else {
        return res.redirect('/users/login')
    }

}

module.exports = authMiddleware;