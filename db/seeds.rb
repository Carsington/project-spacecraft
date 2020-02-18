require 'faker'

puts "Cleaning database..."
Spaceship.destroy_all

puts "Creating spaceships..."
20.times do |i|
  spaceship = Spaceship.create!(
    name: Faker::Movies::StarWars.vehicle,
    address: Faker::Movies::StarWars.planet,
    description: Faker::Movies::StarWars.wookiee_sentence,
    main_pic_url: "https://source.unsplash.com/400x320/?aircraft,fighter",
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
