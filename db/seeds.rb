# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


Cocktail.destroy_all
Ingredient.destroy_all

# creating ingred
puts "Fetching ingredients from JSON"
ingredients = JSON.parse(open('https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list').read)
puts "Ingredients fetched"
puts "Adding ingredients"
ingredients['drinks'].each do |drink|
  Ingredient.create(name: drink['strIngredient1'])
end
puts "Adding Cocktails"
10.times do
  Cocktail.create(name: Faker::Hipster.words(2).join(' '))
end
