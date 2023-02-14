# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
puts "Destroying all users"
User.destroy_all
puts "Creating a user"
user = User.create!(email: "test@test.com", password: "12345678")
puts "Creating flats"
Flat.create(name: "Beachside Villa at Balian Surf Break", rooms: 2, price: 300, user_id: user.id)
Flat.create(name: "Nature Valley Private Pool Villas", rooms: 4, price: 450, user_id: user.id)
Flat.create(name: "Villa Serenity, Brand New Luxury Beachfront Villa", rooms: 4, price: 899, user_id: user.id)
Flat.create(name: "Alfresco Private Villa w/ Pool & Rice Field View", rooms: 1, price: 180, user_id: user.id)
puts "Complete"
