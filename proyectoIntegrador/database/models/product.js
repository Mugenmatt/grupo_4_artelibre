'use strict';
module.exports = (sequelize, DataTypes) => {

  const Product = sequelize.define('Product', {
    id:{
      type: DataTypes.INTEGER,
      primaryKey: true,
      autoIncrement: true
    },
    name: DataTypes.STRING,
    description: DataTypes.TEXT,
    price: DataTypes.INTEGER,
    ancho: DataTypes.INTEGER,
    alto: DataTypes.INTEGER,
    quantity: DataTypes.INTEGER,
    status: DataTypes.INTEGER, 
    idUser: DataTypes.INTEGER,
    imageFile: DataTypes.STRING,
    
  }, {tableName: "products"});

  Product.associate = function(models) {

    Product.belongsTo(models.User,{
      as:"user",
      foreignKey: "idUser"
      
    })

    Product.hasMany(models.Cartitem,{
      as: "cartitems",
      foreignKey: "idProduct"
    })

    Product.hasMany(models.Productimage, {
      as:"productimages",
      foreignKey:"idProduct",
    })

    Product.hasMany(models.Comentario, {
      as:"comentarios",
      foreignKey:"idProduct",
    })

    Product.belongsToMany(models.Keyword,{
      as:"keywords",
      through: "productkeys",
      foreignKey: "idProduct",
      otherKey: "idKeyword",
    })

  };

  return Product;
};