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
    price: DataTypes.DECIMAL,
    size: DataTypes.STRING,
    quantity: DataTypes.INTEGER,
    status: DataTypes.BOOLEAN, 
    idUser: DataTypes.INTEGER,
    
  }, {tablename: "products"});

  Product.associate = function(models) {

    Product.belongsTo(models.User,{
      as:"user",
      foreignKey: "idUser"
      
    })

    Product.hasMany(models.Productimage, {
      as:"productimages",
      foreignKey:"idProduct",
    })

    Product.belongsToMany(models.Keyword,{
      as:"keywords",
      through: "Productkey",
      foreignKey: "idProduct",
      otherKey: "idKeyword",
    })

  };

  return Product;
};