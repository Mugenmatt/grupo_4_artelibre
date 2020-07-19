'use strict';
module.exports = (sequelize, DataTypes) => {

  const Order = sequelize.define('Order', {
    total: DataTypes.DECIMAL,
    orderNumber: DataTypes.INTEGER,
    userId: DataTypes.INTEGER
  },
  {tablename: "orders"});

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