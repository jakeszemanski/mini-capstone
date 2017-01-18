# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
products = Product.create([{name: 'wallet'}, {price: '12.99'}, {image: 'http://pngimg.com/upload/wallet_PNG7517.png'}, {description: 'A container for money'}])