'use strict';
module.exports = (sequelize, DataTypes) => {
  
  const User = sequelize.define('User', {
    name: DataTypes.STRING,     //JUAN: No falta id aca??
    lastname:DataTypes.STRING,
    username: DataTypes.STRING,
    email: DataTypes.STRING,
    avatar: DataTypes.STRING,
    password: DataTypes.STRING,
    rol: DataTypes.BOOLEAN, // FACU: esto deberia ser tinyint(4), talvez no es boolean --- JUAN: Exacto. Boolean trae problemas, se resuelve con la misma logica pero con el Type Tinyint.
    mailShipping: DataTypes.BOOLEAN,     // JUAN: Lo mismo aca. se aplica misma logica de boolean pero con tinyint.
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