# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
puts "Cleaning the DB..."
Pet.destroy_all


puts "Creating pets..."
50.times do
  Pet.create!(
    name: Faker::Creature::Horse.unique.name,
    address: Faker::Address.street_address,
    species: Pet::SPECIES.sample,
    found_on: Date.today - rand(1..10)
  )
end
puts "... created #{Pet.count} pets."