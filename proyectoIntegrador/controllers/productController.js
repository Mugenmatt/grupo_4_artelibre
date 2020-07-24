const {Product, Cartitem, Comentario}= require('../database/models/');

const productController = {
    index: function(req, res) {
      let usuarioEnSesion= req.session.user;
      let obra;
      let enCarrito = false;

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
        enCarrito = item? true : false;

        return Comentario.findAll({
          where: {
            idProduct: obra.id
          }
        })

      }))
      .then((comentarios)=>{
        return res.render('product',{obra,enCarrito, comentarios});

      })
      .catch(errors=>{
        console.log(errors);
      })

    }
}

module.exports= productController;