const db= require('../database/models/')
const User = db.User;
const Productimage = db.Productimage;

const galleryController = {
    index: function(req, res) {
      let artistas = User.findAll({
        where:{
          rol:1
        }
      })

      let obras = Productimage.findAll(
        // {include: ['product'],
        // raw:true,
        // nest: true
        //}
        );
      
        // FACU: la asociacion de imagen producto con producto no esta funcionando, por eso lo deje comentado.
        //tengo que traer solo una de las fotos de ese producto, para que no se repitan productos.
        
      Promise.all([artistas,obras])
        .then(([artistas,obras])=>{
          return res.render('gallery',{artistas,obras})
        })
        .catch(errors=>console.log(errors));



      //return res.render('gallery');
      }
}

module.exports= galleryController;