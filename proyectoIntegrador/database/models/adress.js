'use strict';
module.exports = (sequelize, DataTypes) => {

  const Adress = sequelize.define('Adress', {
    street: DataTypes.STRING,
    number: DataTypes.INTEGER, 
    floor: DataTypes.INTEGER,
    door: DataTypes.INTEGER,
    idUser: DataTypes.INTEGER

  }, {tablename: "adresses"});

  Adress.associate = function(models) {
      
    Adress.belongsTo(models.User,{
        as:"user",
        foreignKey:"idUser"
    })
    
  };

  return Adress;
};


