'use strict';
module.exports = (sequelize, DataTypes) => {

  const Keyword = sequelize.define('Keyword', {
    name: DataTypes.STRING,
  }, {tablename: "keywords"});

  Keyword.associate = function(models) {

    Keyword.belogsToMany(models.Product,{
      as:"products",
      through: "Productkey",
      foreignKey: "idKeyword",
      otherKey: "idProduct",
    })
    
  };

  return Keyword;
};