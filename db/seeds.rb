# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

puts "Cleaning database..."
Spaceship.destroy_all

puts "Creating spaceships..."
20.times do |i|
  spaceship = Spaceship.create!(
    name: Faker::Movies::StarWars.vehicle,
    address: Faker::Movies::StarWars.planet,
    description: Faker::Movies::StarWars.wookiee_sentence,
    main_pic_url: Faker::LoremFlickr.image(size: "60x50", search_terms: ['vehicle']),
    unit_price: rand(1..150) * 1000,
    size: rand(10..1000),
    max_speed: rand(5..50),
    capacity: [1, 2, 4, 8, 16, 32, 64, 128, 256].sample
  )
  puts "#{i + 1}. #{spaceship.name} (Planet: #{spaceship.address})"
  puts "Size: #{spaceship.size}m - Capacity: #{spaceship.capacity} - Max speed: #{spaceship.max_speed}pc/day"
  puts "#{spaceship.unit_price}$/day"
end

puts "Finished!"
