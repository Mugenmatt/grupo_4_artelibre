'use strict';
module.exports = (sequelize, DataTypes) => {

  const Keyword = sequelize.define('Keyword', {
    id:{
      type: DataTypes.INTEGER,
      primaryKey: true,
      autoIncrement: true
    },
    name: DataTypes.STRING,
  }, {tablename: "keywords"});

  Keyword.associate = function(models) {

    Keyword.belongsToMany(models.Product,{
      as:"products",
      through: "productkeys",
      foreignKey: "idKeyword",
      otherKey: "idProduct",
    })
    
  };

  return Keyword;
};