# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


puts 'Deleteing all data'
Area.destroy_all
House.destroy_all
User.destroy_all
puts 'Data deleted'
puts 'Creating Users, Areas and Houses'
# images here

5.times do
  area = Area.new(
    name:Faker::HarryPotter.character,
    sold_price: rand(500000..1000000),
    schools:Faker::HarryPotter,
    crime:rand(),
    demographics:rand() ,
    price:rand(500000..1000000),
    growth:rand(),
    demand: rand()
  )
  area.save!
end

5.times do
  user = User.new(
    email: Faker::Internet.email,
    username: Faker::Internet.username,
    name: Faker::Name.name,
    password: '123456'
  )
  user.save!
  counter = 0
end

5.times do
  house = House.new(
    address: Faker::Address.street_address,
    postcode: Faker::Address.postcode,
    bedroom: rand(1..6),
    description: Faker::Lorem.paragraph(sentence_count: 2),
    rate: rand(150..500),
    bathroom: rand(10..40),
    square_feet:rand(100..300),
    council_tax: rand(a,b,c,d,e,f),
    ptal:rand( 1a, 1b, 2, 3, 4, 5, 6a, 6b),
    green_belt: rand( true, false),
    area: Area.all.sample,
    restaurants:Faker::Restaurant.name
  )
end
house.save!
end
puts 'Finished!'
