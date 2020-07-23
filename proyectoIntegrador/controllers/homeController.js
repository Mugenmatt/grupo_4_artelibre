const {Consulta} = require('../database/models')

const homeController = {
    index: function(req, res) {
        return res.render('index');
      },

    contactanos: function(req,res){

      Consulta.create(req.body)
      .then(()=>{

        return res.redirect("/")
      })
      .catch(errors=> console.log(errors))
    }
}

module.exports= homeController;