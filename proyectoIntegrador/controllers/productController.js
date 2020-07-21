const db= require('../database/models/');
const Product = db.Product;

const productController = {
    index: function(req, res) {
      
      Product.findByPk(req.params.id,{
        include: ['user']
      })
      .then(function(obra){
        return res.render('product',{obra});

      }).catch(errors=>{
        console.log(errors);
      })

    }
}

module.exports= productController;