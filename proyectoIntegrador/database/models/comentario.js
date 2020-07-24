'use strict';
module.exports = (sequelize, DataTypes) => {

  const Comentario = sequelize.define('Comentario', {
    comentario: DataTypes.TEXT,
    respuesta: DataTypes.TEXT,
    idUser: DataTypes.INTEGER,
    idSeller: DataTypes.INTEGER,
    idProduct: DataTypes.INTEGER

  }, {tableName:'comentarios'});

  Comentario.associate = function(models) {

    Comentario.belongsTo(models.User,{
      as: 'user',
      foreignKey: 'idUser'
    })

    Comentario.belongsTo(models.User,{
      as: 'seller',
      foreignKey: 'idSeller'
    })

    Comentario.belongsTo(models.User,{
      as: 'product',
      foreignKey: 'idProduct'
    })


  };

  return Comentario;
};