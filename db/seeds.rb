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
user1 = User.create!(first_name: "Host", last_name: "Name", email: "host@test.com", password: "12345678")
user2 = User.create!(first_name: "Renter", last_name: "Name", email: "renter@test.com", password: "12345678")
puts "Creating flats"
flat1 = Flat.create(name: "Beachside Villa at Balian Surf Break", description: "Great flat by the sea",
                    address: "16 Villa Gaudelet, Paris", rooms: 2, price: 300, user_id: user1.id)
flat2 = Flat.create(name: "Nature Valley Private Pool Villas", description: "Good Kebaps",
                    address: "Casablanca-Settat, Morocco", rooms: 4, price: 450, user_id: user1.id)
flat3 = Flat.create(name: "Villa Serenity, Brand New Luxury Beachfront Villa",
                    description: "Just as quiet as a graveyard", address: "Calle De Los Pajaritos, 28590 Villarejo de Salvanés, Madrid, Spain", rooms: 4, price: 899, user_id: user1.id)
flat4 = Flat.create(name: "Alfresco Private Villa w/ Pool & Rice Field View",
                    description: "You will not want to eat rice anymore", address: "Westermarkt 20, 1016 DK Amsterdam, Netherlands", rooms: 1, price: 180, user_id: user1.id)
puts "Complete"
flat1.photo.attach(io: File.open(Rails.root.join("app/assets/images/flat1.jpg")), filename: "flat1")
flat2.photo.attach(io: File.open(Rails.root.join("app/assets/images/flat2.jpg")), filename: "flat2")
flat3.photo.attach(io: File.open(Rails.root.join("app/assets/images/flat3.jfif")), filename: "flat3")
flat4.photo.attach(io: File.open(Rails.root.join("app/assets/images/flat4.jfif")), filename: "flat4")
puts "Added images"
user1.avatar.attach(io: File.open(Rails.root.join("app/assets/images/user1.png")), filename: "user1")
user2.avatar.attach(io: File.open(Rails.root.join("app/assets/images/user2.jpg")), filename: "user2")
puts "Added avatar photos"
