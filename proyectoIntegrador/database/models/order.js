'use strict';
module.exports = (sequelize, DataTypes) => {

  const Order = sequelize.define('Order', {
    total: DataTypes.INTEGER,
    orderNumber: DataTypes.INTEGER,
    userId: DataTypes.INTEGER
  },
  {tableName: "orders"});

  Order.associate = function(models) {

    Order.hasMany(models.Cartitem,{
      as: "cartitems",
      foreignKey: "idOrder"
    })

    Order.belongsTo(models.User,{
      as: "order",
      foreignKey: "userId"
    })

  };

  return Order;
};