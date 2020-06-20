'use strict';
module.exports = (sequelize, DataTypes) => {
  
  const User = sequelize.define('User', {
    name: DataTypes.STRING,
    lastname:DataTypes.STRING,
    username: DataTypes.STRING,
    email: DataTypes.STRING,
    avatar: DataTypes.STRING,
    password: DataTypes.STRING,
    rol: DataTypes.BOOLEAN, // FACU: esto deberia ser tinyint(4), talvez no es boolean
    mailShipping: DataTypes.BOOLEAN,
    privateShipping: DataTypes.BOOLEAN,
    noShipping: DataTypes.BOOLEAN,
    averageScore: DataTypes.DECIMAL,

  }, {});

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