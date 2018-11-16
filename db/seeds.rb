# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Cocktail.destroy_all

# photos we can use
photourls = ['https://www.theflavorbender.com/wp-content/uploads/2017/07/COCKTAILS-2.jpg']

# creating ingred
if Ingredient.all.count == 0
  puts "Fetching ingredients from JSON"
  ingredients = JSON.parse(open('https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list').read)
  puts "Ingredients fetched"
  puts "Adding ingredients"
  ingredients['drinks'].each do |drink|
    Ingredient.create(name: drink['strIngredient1'])
  end
end

puts "Adding Cocktails"
10.times do
  c = Cocktail.create(name: Faker::Hipster.words(2).join(' '))
  c.remote_photo_url = photourls.sample
  c.save
end
