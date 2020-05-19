const bcryptjs = require('bcryptjs')


const registerController = {
    index: function(req, res) {
        res.render('register');
      }
}

module.exports= registerController;