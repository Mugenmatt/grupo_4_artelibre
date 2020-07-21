const db= require('../database/models/');
const User = db.User;
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
           where:{
             status: 0
           },
           include: ["productimages", "user"]
          }
        );
        
      Promise.all([artistas,obras])
        .then(function([artistas,obras]){
          const nombresArtistas = artistas.map(artista=>{
            return artista.username
          })
          return res.render('gallery',{artistas,obras,nombresArtistas})
        })
        .catch(errors=>console.log(errors));
    },

    byArtist: function(req,res){
      let artistId = req.params.artistId;

      User.findByPk(artistId,{
        include: ['products']
      }).then(function(artista){
        return res.render('artist-gallery',{artista})
      })
      .catch(errors=>console.log(errors));

    }
}

module.exports= galleryController;