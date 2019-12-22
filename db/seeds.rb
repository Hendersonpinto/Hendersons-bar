# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'open-uri'
require 'json'


url = "https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list"
list = open(url).read
# p list
result = JSON.parse(list)
# p result.class
# p result.size

# p result["drinks"][0]["strIngredient1"]

result["drinks"].each do |ingredient|

  Ingredient.create(name: ingredient["strIngredient1"])
end

p Ingredient.all
p Ingredient.all.size





url2 = "https://www.thecocktaildb.com/api/json/v1/1/search.php?f=a"
list2 = open(url2).read
# p list
result2 = JSON.parse(list2)
# p result.class
# p result.size

# p result["drinks"][0]["strIngredient1"]
i=0;
while i<10
Cocktail.create(name: result2["drinks"][i]["strDrink"])
i+=1
end
# Cocktail.create(name: result2["drinks"][0]["strDrink"])
