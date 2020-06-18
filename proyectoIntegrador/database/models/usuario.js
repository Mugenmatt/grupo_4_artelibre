'use strict';
module.exports = (sequelize, DataTypes) => {
  
  const Usuario = sequelize.define('Usuario', {
    userName: DataTypes.STRING
  }, {});

  Usuario.associate = function(models) {
    // associations can be defined here
  };

  return Usuario;
};