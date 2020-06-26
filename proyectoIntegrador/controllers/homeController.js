const homeController = {
    index: function(req, res, next) {
        res.render('index');
      }
}

module.exports= homeController;