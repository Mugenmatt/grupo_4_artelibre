'use strict';
module.exports = (sequelize, DataTypes) => {
  const Producto = sequelize.define('Producto', {
    name: DataTypes.STRING
  }, {});
  Producto.associate = function(models) {
    // associations can be defined here
  };
  return Producto;
};