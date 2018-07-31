
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Ingredient.create(name: "lemon")
# Ingredient.create(name: "ice")
# Ingredient.create(name: "mint leaves")

require 'json'
require 'open-uri'
require "faker"

file = open('https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list')
ingredients = JSON.parse(file.read)
ingredients["drinks"].each do |ingredient|
  Ingredient.create(name: ingredient["strIngredient1"])
end

8.times do
  url = "https://www.funnyhowflowersdothat.co.uk/sites/flowers/files/styles/article_portrait/public/field/image/photo-2015-01-17-5.jpeg?itok=NLtfyQAY"
  cocktail= Cocktail.new(name: Faker::Coffee.blend_name)
  file = open('https://www.thecocktaildb.com/api/json/v1/1/random.php')
  pics = JSON.parse(file.read)
  cocktail.remote_photo_url = pics["drinks"][0]["strDrinkThumb"]
  cocktail.save
end


