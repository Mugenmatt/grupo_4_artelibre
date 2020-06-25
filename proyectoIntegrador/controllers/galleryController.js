const db= require('../database/models/');
const User = db.User;
const Productimage = db.Productimage;
const Product = db.Product;

const galleryController = {
    index: function(req, res) {

      let artistas = User.findAll({
        where:{
          rol:1
        }
      });

      let obras = Product.findAll(
         {
           include: ["productimages"]
          }
        );
        
      Promise.all([artistas,obras])
        .then(function([artistas,obras]){
          return res.render('gallery',{artistas,obras})
        })
        .catch(errors=>console.log(errors));
/* 
obras.prodcutimages[0]
*/


      },

      byArtist: function(req,res){
        let artistId = req.params.artistId;

        let artistas = User.findAll({
          where:{
            rol:1
          }
        });

        let artista = User.finByPk(artistId,{
          include: {
            all: true,
            nested: true
          }
        });

        /* 
        artista.products.forEach(producto=>{
          producto.productimages[0]
        })
        */
        
        Promise.all([artistas,obras])
        .then(function([artistas,obras]){
          return res.render('gallery',{artistas,artista})
        })
        .catch(errors=>console.log(errors));


      }
}

module.exports= galleryController;