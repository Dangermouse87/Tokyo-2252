Park.destroy_all if Rails.env.development?

Park.create!(
  name: "My Little Park",
  banner_url: "https://raw.githubusercontent.com/lewagon/fullstack-images/master/rails/parks-and-dinosaurs/garden_1.jpg"
)

Park.create!(
  name: "My Other Park",
  banner_url: "https://raw.githubusercontent.com/lewagon/fullstack-images/master/rails/parks-and-plants/garden_2.jpg"
)