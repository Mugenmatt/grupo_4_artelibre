const db= require('../database/models/')
const User = db.User;
const Productimage = db.Productimage;
const Product = db.Product;

const galleryController = {
    index: function(req, res) {

      let artistas = User.findAll({
        where:{
          rol:1
        }
      }).catch(errors=>console.log(errors))

      let obras = Productimage.findAll(
         //{include: [{association:"product"}]}
        ).catch(errors=>console.log(errors));
      
        // FACU: la asociacion de imagen producto con producto no esta funcionando, por eso lo deje comentado.
        //tengo que traer solo una de las fotos de ese producto, para que no se repitan productos.
        
      Promise.all([artistas,obras])
        .then(function([artistas,obras]){
          return res.render('gallery',{artistas,obras})
        })
        .catch(errors=>console.log(errors));

      },

      byArtist: function(req,res){
        let artistId = req.params.artistId;

        let artistas = User.findAll({
          where:{
            rol:1
          }
        }).catch(errors=>console.log(errors))

        //FACU: por ahora hay problema con el product asi que no funciona. a preguntar.
        let obras = Product.findAll({
            where:{
              idUser: artistId
            }
          }).catch(errors=>console.log(errors))
        
        Promise.all([artistas,obras])
        .then(function([artistas,obras]){
          return res.render('gallery',{artistas,obras})
        })
        .catch(errors=>console.log(errors));


      }
}

module.exports= galleryController;