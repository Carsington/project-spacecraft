require 'faker'

NB_USERS = 50
NB_SPACESHIPS = 15
NB_BOOKINGS = 8

puts "Cleaning database..."
User.destroy_all

puts "Creating users..."
NB_USERS.times do
  user = User.new(
    email: Faker::Internet.safe_email,
    password: Faker::Internet.password,
    nickname: Faker::Movies::StarWars.character,
    age: rand(7..77),
    avatar_url: Faker::LoremFlickr.image(size: "200x200", search_terms: ['kitten'])
  )
  user.save
end
puts "#{User.all.length}/#{NB_USERS} users created"

puts "Creating spaceships..."
users = User.all

NB_SPACESHIPS.times do |i|
  spaceship = Spaceship.new(
    user: users.sample,
    name: Faker::Movies::StarWars.vehicle,
    address: Faker::Movies::StarWars.planet,
    description: Faker::Movies::StarWars.wookiee_sentence,
    main_pic_url: Faker::LoremFlickr.image(size: "200x200", search_terms: ['jedi']),
    unit_price: rand(20..250),
    size: rand(10..1000),
    max_speed: rand(5..50),
    capacity: [1, 2, 4, 8, 16, 32, 64, 128, 256].sample
  )
  # puts "#{i + 1}. #{spaceship.name} (Planet: #{spaceship.address})"
  # puts "Size: #{spaceship.size}m - Capacity: #{spaceship.capacity} - Max speed: #{spaceship.max_speed}pc/day"
  # puts "#{spaceship.unit_price}$/day"

  spaceship.save
end
puts "#{Spaceship.all.length}/#{NB_SPACESHIPS} spaceships created"

puts "Creating bookings..."
spaceships = Spaceship.all

NB_BOOKINGS.times do
  spaceship = spaceships.sample
  user = users.sample
  start_date = Faker::Date.between(from: 15.days.ago, to: Date.today)
  end_date = Faker::Date.between(from: 2.days.from_now, to: 15.days.from_now)

  booking = Booking.new(
    spaceship: spaceship,
    user: user,
    start_date: start_date,
    end_date: end_date,
    total_price: spaceship.unit_price * (end_date - start_date)
  )
  booking.save
end
puts "#{Booking.all.length}/#{NB_BOOKINGS} bookings created"

puts "Finished!"
