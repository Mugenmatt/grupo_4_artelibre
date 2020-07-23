'use strict';
module.exports = (sequelize, DataTypes) => {

  const Consulta = sequelize.define('Consulta', {
    nombre: DataTypes.STRING,
    email: DataTypes.STRING,
    consulta: DataTypes.TEXT,
    
  }, {tableName:"consultas"});

  // Consulta.associate = function(models) {
  // };

  return Consulta;
};