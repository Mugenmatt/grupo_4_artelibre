const {Consulta, Product} = require('../database/models')

const homeController = {
    index: function(req, res) {

      Product.findAll({
        where: {
          status: 0
        },
        order: [['id','DESC']],
        limit:5
      })
      .then(obras=>{

        return res.render('index',{obras});
      })

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