# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require 'faker'

puts "Destroying all flats and users"
Flat.destroy_all
User.destroy_all

puts "Creating users"
user1 = User.create!(first_name: "Host", last_name: "Name", email: "host@test.com", password: "12345678")
user2 = User.create!(first_name: "Renter", last_name: "Name", email: "renter@test.com", password: "12345678")

puts "Creating flats"
flat1 = Flat.create(name: "Beachside Villa at Balian Surf Break",
                    description: "Aura House is perched on top of the Ayung river offering a beautiful view. It features 2 very romantic en-suite bedrooms, a large living room fully furnished, a small kitchen, and a private swimming pool with view. It is the perfect gateway for adventurous couples and honeymoon.The whole house is private - it is just for you and your guests, We are very proud to have in Aura House one of the famous egg shaped door built by the designer company Ibuku. It is the entrance of the second bedroom. The atmosphere of Aura House is perfect for people looking to disconnect from their busy city life and/or nature enthusiasts. Be ready to be awaken by the sun peeking up into your room and the sounds of the river down below.",
                    address: "16 Villa Gaudelet, Paris",
                    rooms: 2,
                    price: 300,
                    user_id: user1.id)
flat2 = Flat.create(name: "Nature Valley Private Pool Villas",
                    description: "The bamboo house is located at the main tourist district of Sidemen, a small town with a magnificent landscape in the southern flank of Mount Agung. Sidemen is not a touristy area, it is about a 90-minute drive from Bali Airport and a 45-minute drive from Ubud. Besides the beautiful scenery and the indigenous culture Sidemen also surrounded by a lot of famous tourist destinations in Bali. Some of them include; Lempuyang Temple (The Gateway to Heaven), Besakih (The Mother Temple of Bali), Tirta Gangga Royal Water Palace, Telaga Waja River for Rafting, Amed Diving Spot, and Bias Putih the Virgin Beach.",
                    address: "Casablanca-Settat, Morocco",
                    rooms: 4,
                    price: 450,
                    user_id: user1.id)
flat3 = Flat.create(name: "Villa Serenity, Brand New Luxury Beachfront Villa",
                    description: "This beautifully designed 1 bedroom villa offers a cosy indoor living space, fully equipped kitchen and swimming pool with an amazing jungle view. The villa is fully staffed with daily cleaning, gardening and pool maintenance. Enter your own Balinese paradise, a mere 10 minute ride to the center of Ubud.",
                    address: "Calle De Los Pajaritos, 28590 Villarejo de Salvanés, Madrid, Spain",
                    rooms: 4,
                    price: 899,
                    user_id: user1.id)
flat4 = Flat.create(name: "Alfresco Private Villa w/ Pool & Rice Field View",
                    description: "The Dome is a one bedroom bamboo villa built on two floors. Its ground floor houses an open air living room fitted with a dining area, a seating area and balinese style hammock.
                    The living room has direct access to a spacious balinese style garden and the beautiful Santorini style infinity pool.
                    Amenities in the living room include a projector with Netflix, Nespresso coffee machine and refrigerated minibar.
                    The master bedroom on the upper floor is fitted with a king size bed, a walk-in wardrobe, air conditioning, an in-room bathtub from where our guests can enjoy the beautiful rice fields views and a balcony overlooking the famous volcano Mount Agung. The bedroom houses a modernly equipped bathroom.",
                    address: "Westermarkt 20, 1016 DK Amsterdam, Netherlands",
                    rooms: 1,
                    price: 180,
                    user_id: user1.id)
flat5 = Flat.create(name: "Cycladic home with awesome views",
                    description: "Art Villa gives you exquisite ocean views, thriving ambient rainforest, and bold contemporary design. Relax atop the rainforest in a royal canopy of great taste, a garden nucleus. Drink in a delicious view of the jungle-framed sea. Disconnect from the city yet stay connected with our fiber optic internet. We are only 1km from the main road and beach on a steep unpaved road hill, giving you superb ocean view but you need 4x4 car for access.",
                    address: "Ermou 2, Athina 105 63, Greece",
                    rooms: 5,
                    price: 580,
                    user_id: user1.id)

puts "Attaching flat images"
flat1.photo.attach(io: File.open(Rails.root.join("app/assets/images/flat1.jpg")), filename: "flat1")
flat2.photo.attach(io: File.open(Rails.root.join("app/assets/images/flat2.jpg")), filename: "flat2")
flat3.photo.attach(io: File.open(Rails.root.join("app/assets/images/flat3.jpg")), filename: "flat3")
flat4.photo.attach(io: File.open(Rails.root.join("app/assets/images/flat4.jfif")), filename: "flat4")
flat5.photo.attach(io: File.open(Rails.root.join("app/assets/images/flat5.jfif")), filename: "flat5")

puts "Adding user avatars"
user1.avatar.attach(io: File.open(Rails.root.join("app/assets/images/user1.png")), filename: "user1")
user2.avatar.attach(io: File.open(Rails.root.join("app/assets/images/user2.jpg")), filename: "user2")

puts "Complete!"
