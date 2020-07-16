'use strict';
module.exports = (sequelize, DataTypes) => {

  const Cart = sequelize.define('Cart', {
    price: DataTypes.DECIMAL,
    status: DataTypes.INTEGER,
    idUser: DataTypes.INTEGER,  
    idOrder: DataTypes.INTEGER,  
    idProduct: DataTypes.INTEGER,  
    idSeller: DataTypes.INTEGER

  }, {tablename: "carts"});

  Cart.associate = function(models) {

    Cart.belongsTo(models.User,{
      as: "user",
      foreignKey: "idUser"
    })

    Cart.belongsTo(models.User,{
      as: "seller",
      foreignKey: "idSeller"
    })

    Cart.belongsTo(models.Product,{
      as: "product",
      foreignKey: "idProduct"
    })

    Cart.belongsTo(models.Order,{
      as: "order",
      foreignKey: "idOrder"
    })

  };

  return Cart;
};