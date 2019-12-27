require 'open-uri'
require 'json'
puts "Fetching cocktails"
alphabet = ("a".."z").to_a
alphabet.each do |letter|
  url2 = "https://www.thecocktaildb.com/api/json/v1/1/search.php?f=#{letter}"
  list2 = open(url2).read
  result2 = JSON.parse(list2)
  result2["drinks"].each do |cocktail|
    p cocktail["strDrink"]
    # cock1 = Cocktail.create(name: cocktail["strDrink"], category:cocktail["strCategory"], instructions:cocktail["strInstructions"])
    (1..15).each do |num|
      if cocktail["strIngredient#{num}"]
        # p cocktail["strIngredient#{num}"]
        # p cocktail["strMeasure#{num}"]
      dose = Dose.new(cocktail: cocktail, ingredient: Ingredient.find_or_create_by(name: cocktail["strIngredient#{num}"]), description: cocktail["strMeasure#{num}"])
      p dose
      end
    end
  end
end
