# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
puts "destroying everything..."



puts "everything destroyed!"

garden_names = [
  "French garden",
  "My Cute Balcony",
  "English garden",
  "Flowered patio",
  "Garden in Japan",
  "Walk among flowers"
]

garden_names.each do |garden_name|
  puts "creating #{garden_name}..."
  garden_request = RestClient.get("https://plus.unsplash.com/premium_photo-1675039871605-eb156cc0575d?q=80&w=1932&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D")
  garden = Garden.new(
      name: garden_name,
      banner_url: garden_request.request.url
    )
  garden.save!
  3.times do
    plant_request = RestClient.get("https://images.unsplash.com/photo-1520412099551-62b6bafeb5bb?q=80&w=1887&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D")
    plant = Plant.new(
      name: Faker::FunnyName.name,
      image_url: plant_request.request.url
    )
    plant.garden = garden
    plant.save!
    sleep(2)
  end
  puts "#{garden_name} created!"
end
