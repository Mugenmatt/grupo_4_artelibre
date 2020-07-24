'use strict';
module.exports = (sequelize, DataTypes) => {
  
  const User = sequelize.define('User', {
    id:{
      type: DataTypes.INTEGER,
      primaryKey: true,
      autoIncrement: true
    },
    name: DataTypes.STRING,
    lastname:DataTypes.STRING,
    username: DataTypes.STRING,
    email: DataTypes.STRING,
    avatar: DataTypes.STRING,
    password: DataTypes.STRING,
    newsletter: DataTypes.BOOLEAN,
    rol: DataTypes.BOOLEAN, 
    mailShipping: DataTypes.BOOLEAN,    
    privateShipping: DataTypes.BOOLEAN,
    noShipping: DataTypes.BOOLEAN,
    averageScore: DataTypes.DECIMAL,

  }, {tableName: "users"});

  User.associate = function(models) {

    User.hasMany(models.Cartitem,{
      as: "userCartitems",
      foreignKey: "idUser"
    })

    User.hasMany(models.Cartitem,{
      as: "sellerCartitems",
      foreignKey: "idSeller"
    })

    User.hasMany(models.Product,{
      as: "products",
      foreignKey: "idUser"
    })

    User.hasMany(models.Adress,{
      as:"adresses",
      foreignKey:"idUser"
    })

    User.hasMany(models.Comentario,{
      as:"comentarios",
      foreignKey:"idUser"
    })

    User.hasMany(models.Comentario,{
      as:"respuestas",
      foreignKey:"idSeller"
    })

    User.hasMany(models.Order,{
      as:"orders",
      foreignKey:"userId"
    })

  };

  return User;
};