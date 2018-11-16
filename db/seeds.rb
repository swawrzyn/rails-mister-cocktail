# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Cocktail.destroy_all

# photos we can use
photourls = ['https://www.theflavorbender.com/wp-content/uploads/2017/07/COCKTAILS-2.jpg',
             'https://stevethebartender.com.au/wp-content/uploads/2015/11/winter-sun-cocktail.jpg',
             'https://cdn.liquor.com/wp-content/uploads/2016/07/14070101/aviation-720FB.jpg',
             'https://www.giverecipe.com/wp-content/uploads/2016/04/Strawberry-Lime-Champagne-1.jpg',
             'https://gl-images.condecdn.net/image/YOlzxZQY75z/crop/1800/f/halloween-cocktails_sq.jpg',
             'https://usateatsiptrip.files.wordpress.com/2018/04/keggedcocktails.jpg?w=1000&h=600&crop=1',
             'http://imbibemagazine.com/wp-content/uploads/2018/01/snake-in-grass-pouring-ribbons-crdt-paul-wagtouicz-web-1024x683.jpeg',
             'http://streeton1st.com/wp-content/themes/streetonfirst/assets/img/cocktails--menu-img.jpg']

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

# puts "Adding Cocktails"
# 10.times do
#   c = Cocktail.create(name: Faker::Hipster.words(2).join(' '))
#   c.remote_photo_url = photourls.sample
#   c.save
# end
