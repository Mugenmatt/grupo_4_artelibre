const {Cartitem, Product, Order} = require('../database/models')

const cartController = {
    index: function(req, res) {
      let usuarioEnSesion= req.session.user;

      Cartitem.findAll({
        include:['product','seller'],
        where:{
          idUser:usuarioEnSesion.id,
          status: 0
        }
      })
      .then((items)=>{
        res.render('cart',{items});

      })
      .catch(errors=> console.log(errors))

    },

    agregarAlCarrito: function(req,res){
      let productId = req.body.productId;
      let usuarioEnSesion= req.session.user;

      Product.findByPk(productId)
      .then(product=>{
        let item= {
          price: product.price,
          status: 0,
          idUser: usuarioEnSesion.id,  
          idOrder: null,  
          idProduct: productId,  
          idSeller: product.idUser
        }

        return Cartitem.create(item)
      })
      .then(()=>{
        return res.redirect('/cart')
      })
      .catch(errors=> console.log(errors))

    },

    eliminarDelCarrito: function (req,res){
      let itemId = req.body.itemId;

      Cartitem.destroy({
        where: {
          id: itemId
        }
      })
      .then(()=>{
        return res.redirect('/cart')
      })
      .catch(errors=> console.log(errors))

    },

    efectuarCompra: function (req,res) {
      let usuarioEnSesion= req.session.user;
      let items=[];
      let numeroDeOrdenNuevo=1;

      Cartitem.findAll({
        where:{
          idUser:usuarioEnSesion.id,
          status: 0
        }
      })
      .then((itemsEncontrados)=>{
        items = itemsEncontrados;

        return Order.findOne({
          order:[
            ['orderNumber','DESC']
          ]
        })

      })
      .then((orden=>{
        if (orden) {
          numeroDeOrdenNuevo = orden.orderNumber + 1;
        }

      }))
      .then(()=>{
        let precioFinal=0;

        items.forEach(item => {
          precioFinal += item.price
        });

        let ordenACrear = {
          orderNumber: numeroDeOrdenNuevo,
          total:precioFinal,
          userId: usuarioEnSesion.id
        }

        return Order.create(ordenACrear)
      })
      .then((ordenCreada)=>{
        return Cartitem.update({
          idOrder: ordenCreada.id,
          status: 1
        },{
          where:{
            status:0,
            idUser: usuarioEnSesion.id
          }
        })
      })
      .then(()=>{
        return res.redirect('/')
      })
      .catch(errors=> console.log(errors))

    }
}

module.exports= cartController;