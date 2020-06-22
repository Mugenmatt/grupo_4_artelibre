'use strict';
module.exports = (sequelize, DataTypes) => {

  const Productkey = sequelize.define('Productkey', {
    idProduct: {
      type: DataTypes.INTEGER,
      references:{
        model: 'Product', key: 'id'
      }
    },

    idKeyword:{
      type: DataTypes.INTEGER,
      references:{
        model: 'Keyword', key: 'id'
      }
    }
  }, {tablename: "productkeys"});

  Productkey.associate = function(models) {

    Productkey.hasMany(models.Product,{
      as:"products",
      foreignKey: "idProduct"
    })

    Productkey.hasMany(models.Keyword,{
      as:"keywords",
      foreignKey: "idKeyword"
    })


  };

  return Productkey;
};