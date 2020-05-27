const bcryptjs = require('bcryptjs')


const specificRegisterController = {
    index: function (req, res) {
        res.render('specific-register');
    }
}

module.exports = specificRegisterController;