'use strict';
module.exports = (sequelize, DataTypes) => {

  const Adress = sequelize.define('Adress', {
    id:{
      type: DataTypes.INTEGER,
      primaryKey: true,
      autoIncrement: true
    },
    street: DataTypes.STRING,
    number: DataTypes.INTEGER, 
    floor: DataTypes.INTEGER,
    door: DataTypes.INTEGER,
    cp: DataTypes.INTEGER, 
    province: DataTypes.STRING, 
    city: DataTypes.STRING,
    idUser: DataTypes.INTEGER

  }, {tableName: "adresses"});

  Adress.associate = function(models) {
      
    Adress.belongsTo(models.User,{
        as:"user",
        foreignKey:"idUser"
    })
    
  };

  return Adress;
};


