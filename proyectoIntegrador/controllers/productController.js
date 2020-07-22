const {Product, Cartitem}= require('../database/models/');

const productController = {
    index: function(req, res) {
      let usuarioEnSesion= req.session.user;
      let obra;
      Product.findByPk(req.params.id,{
        include: ['user']
      })
      .then(function(obraEncontrada){
        obra = obraEncontrada;

        if (usuarioEnSesion) {
          return Cartitem.findOne({
            where: {
              idUser:usuarioEnSesion.id,
              idProduct: obra.id,
              status: 0
            }
          })
        }
        
      })
      .then((item=>{
        let enCarrito = false;
        enCarrito = item? true : false;

        return res.render('product',{obra,enCarrito});
      }))
      .catch(errors=>{
        console.log(errors);
      })

    }
}

module.exports= productController;