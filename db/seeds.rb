# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
puts "Destroying all flats and users"
Flat.destroy_all
User.destroy_all
puts "Creating a user"
user = User.create!(email: "test@test.com", password: "12345678")
puts "Creating flats"
flat1 = Flat.create(name: "Beachside Villa at Balian Surf Break", description: "Great flat by the seas",
                    address: "16 Villa Gaudelet, Paris", rooms: 2, price: 300, user_id: user.id)
flat2 = Flat.create(name: "Nature Valley Private Pool Villas", rooms: 4, price: 450, user_id: user.id)
flat3 = Flat.create(name: "Villa Serenity, Brand New Luxury Beachfront Villa", rooms: 4, price: 899, user_id: user.id)
flat4 = Flat.create(name: "Alfresco Private Villa w/ Pool & Rice Field View", rooms: 1, price: 180, user_id: user.id)
puts "Complete"
flat1.photo.attach(io: File.open(Rails.root.join("app/assets/images/flat1.jpg")), filename: "flat1")
flat2.photo.attach(io: File.open(Rails.root.join("app/assets/images/flat2.jpg")), filename: "flat2")
flat3.photo.attach(io: File.open(Rails.root.join("app/assets/images/flat3.jfif")), filename: "flat3")
flat4.photo.attach(io: File.open(Rails.root.join("app/assets/images/flat4.jfif")), filename: "flat4")
puts "Added images"
