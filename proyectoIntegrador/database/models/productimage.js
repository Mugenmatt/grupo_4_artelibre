'use strict';
module.exports = (sequelize, DataTypes) => {

  const Productimage = sequelize.define('Productimage', {
    filename: DataTypes.STRING,
    idProduct: DataTypes.INTEGER
  }, {tablename: "productimages"});

  Productimage.associate = function(models) {

    Productimage.belongsTo(models.Product, {
      as: "product",
      foreignKey: "idProduct"
    })

  };

  return Productimage;
};