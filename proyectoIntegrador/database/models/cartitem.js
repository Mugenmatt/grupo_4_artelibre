'use strict';
module.exports = (sequelize, DataTypes) => {

  const Cartitem = sequelize.define('Cartitem', {
    price: DataTypes.INTEGER,
    status: DataTypes.INTEGER,
    idUser: DataTypes.INTEGER,  
    idOrder: DataTypes.INTEGER,  
    idProduct: DataTypes.INTEGER,  
    idSeller: DataTypes.INTEGER

  }, {tablename: "cartitems"});

  Cartitem.associate = function(models) {

    Cartitem.belongsTo(models.User,{
      as: "user",
      foreignKey: "idUser"
    })

    Cartitem.belongsTo(models.User,{
      as: "seller",
      foreignKey: "idSeller"
    })

    Cartitem.belongsTo(models.Product,{
      as: "product",
      foreignKey: "idProduct"
    })

    Cartitem.belongsTo(models.Order,{
      as: "order",
      foreignKey: "idOrder"
    })

  };

  return Cartitem;
};