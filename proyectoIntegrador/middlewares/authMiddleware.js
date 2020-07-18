function authMiddleware(req, res, next) {

    if(req.session.user != undefined) {
        return next();
    } else {
        return res.redirect('/')
    }

}

module.exports = authMiddleware;