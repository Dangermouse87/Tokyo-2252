# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

user1 = User.find_or_create_by!(email: "test@test.com") do |user|
  user.password = "12345678"
end

user2 = User.find_or_create_by!(email: "me@me.com") do |user|
  user.password = "12345678"
end

# Create 10 restaurants using Faker
10.times do
  restaurant = Restaurant.create!(
    name: Faker::Restaurant.name,
    user: [user1, user2].sample
  )
  puts "Restaurant created: #{restaurant.name}"
end