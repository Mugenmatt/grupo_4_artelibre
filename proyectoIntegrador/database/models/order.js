'use strict';
module.exports = (sequelize, DataTypes) => {

  const Order = sequelize.define('Order', {
    total: DataTypes.DECIMAL,
    orderNumber: DataTypes.INTEGER
  },
  {tablename: "orders"});

  Order.associate = function(models) {

    Order.hasMany(models.Cart,{
      as: "cart",
      foreignKey: "idOrder"
    })

  };

  return Order;
};