# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'open-uri'
require 'json'

puts 'Clearing database'

Cocktail.destroy_all
User.destroy_all
Dose.destroy_all
Ingredient.destroy_all

puts 'Creating admin user'

admin = User.create!(email:"admin@hb.com", password:"1234567")

puts 'Fetching Ingredients from thecocktaildb.com'

url = "https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list"
list = open(url).read
result = JSON.parse(list)
# p result.class
# p result.size
unordered = result["drinks"]
ordered = unordered.sort_by{|onehash| onehash["strIngredient1"]}

ordered.each do |ingredient|

  Ingredient.create(name: ingredient["strIngredient1"])
end

# p Ingredient.all
# p Ingredient.all.size

puts "Ingredients loaded"


puts "Fetching cocktails from web"
alphabet = ("a".."z").to_a
alphabet.each do |letter|
  url2 = "https://www.thecocktaildb.com/api/json/v1/1/search.php?f=#{letter}"
  list2 = open(url2).read
  result2 = JSON.parse(list2)
  if result2["drinks"]
    result2["drinks"].each do |cocktail|
      p "THE COCKTAIL NAME IS"
      p cocktail["strDrink"]
      cock1 = Cocktail.create(name: cocktail["strDrink"], category:cocktail["strCategory"], instructions:cocktail["strInstructions"], owner:admin)
      (1..15).each do |num|
        if cocktail["strIngredient#{num}"]
        # p cocktail["strIngredient#{num}"]
        # p cocktail["strMeasure#{num}"]
        dose = Dose.create(cocktail: cock1, ingredient: Ingredient.find_or_create_by(name: cocktail["strIngredient#{num}"]), description: cocktail["strMeasure#{num}"])
        # p dose
        end
      end
    end
  end
end

puts "Cocktails are created."



puts "Selecting most popular cocktails"
pop_names = %w(Mojito Old\ Fashioned Long\ Island\ Tea Negroni Whiskey\ Sour Dry\ Martini Daiquiri Margarita Manhattan Moscow\ Mule)
pop_description = ["A classic Island drink of fresh lime and sweet muddled mint, the Mojito became a favorite during the Prohibition era when rum flights would carry thirsty travellers from Miami to Havana under the cover of night.",
"A classic that's been served since the mid-1800s and is as popular today as it was back then.",
"Four different —and disparate— spirits slugging it out in a single glass, along with triple sec, lemon juice and cola? ",
"Designed as an aperitif, a good Negroni is the very definition of balance and simplicity",
"Spirit, sugar, citrus—the original big three—come together in the Whiskey Sour, whose history stretches back to the Lincoln administration",
"Start with a good London-style gin. From there, add a little (not too much!) dry vermouth and dash of orange bitters",
"The classic Daiquiri is a super simple rum cocktail that’s well-balanced and refreshing. The combination of sweet, sour and spirit is refreshingly tangy and perfect for any occasion.",
"It does not matter who invented, what matters is that someone, somewhere summoned the sacred mixture of tequila, lime, orange liqueur and sugar and gifted it to the world.",
"The greatness of the Manhattan cocktail was recognized while it was still in its hot youth, back in the 1880s, and its acclaim lasted long into the 20th century.",
"The vodka drink with a kick. Simply vodka and ginger beer with a squeeze of lime served over some ice."]
list = []
pop_names.each_with_index do |name, index|
  p name
  pop1 = Cocktail.find_by(name: name)
  p pop1
  pop1.popular = true
  pop1.description = pop_description[index]
  pop1.save!
end

puts "The seeding has been performed successfully"



# A sugar cube soaked in bitters, a shot of whiskey, and an orange peel; creating an impressive and timeless cocktail really is that easy. The old-fashioned drink is one of the best ways to dress up your favorite whiskey.

