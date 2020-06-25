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

  }, {tablename: "users"});

  User.associate = function(models) {

    User.hasMany(models.Product,{
      as: "products",
      foreignKey: "idUser"
    })

    User.hasMany(models.Adress,{
      as:"adresses",
      foreignKey:"idUser"
    })

  };

  return User;
};