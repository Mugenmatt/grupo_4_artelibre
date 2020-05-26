const bcryptjs = require('bcryptjs')


const loginController = {
    index: function (req, res) {
        res.render('login');
    }
}

module.exports = loginController;