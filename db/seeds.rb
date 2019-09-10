require 'faker'

require 'json'
require 'open-uri'

puts 'Deleteing all data'
House.destroy_all
Search.destroy_all
Price.destroy_all
Area.destroy_all
User.destroy_all
puts 'Data deleted'

puts "Creating ADMIN"
puts "test@test.com"
puts "pass: 123456"
User.create! email: "test@test.com", password: "123456"

puts 'Creating Users, Areas and Houses'
# images here

AREA_NAMES = %w(shoreditch lambeth wandsworth hackney camden)
POSTCODE = ["E2 7HE", "SW2 1EG", "SW17 8TY", "EC1Y 8ND", "NW 33NT"]
AVERAGE_DEPOSIT = %w(105051 82405 63540 71013 92097)
# AVERAGE_DEPOSIT = Average income
LATITUDE =%w(51.5250° 51.4594° 51.4341° 51.5236° 51.5431°)
LONGITUDE =%w(0.0755° 0.1173° 0.1584° 0.0898° 0.1718°)


# crime_url = 'https://api.propertydata.co.uk/crime?key=LKWVPEM1HL&postcode=W14+9JH'
# crime_serialized = open(crime_url).read
# crime = JSON.parse(crime_serialized)

5.times do |i|
  crime_url = "https://api.propertydata.co.uk/crime?key=LKWVPEM1HL&postcode=#{POSTCODE[i]}"
  crime = JSON.parse(open(crime_url).read)
  sleep(2)

  school_url = "https://api.propertydata.co.uk/schools?key=LKWVPEM1HL&postcode=#{POSTCODE[i]}"
  school = JSON.parse(open(school_url).read)
  sleep(2)

  sold_price_url = "https://api.propertydata.co.uk/sold-prices?key=LKWVPEM1HL&postcode=#{POSTCODE[i]}&type=flat&max_age=12"
  sold_price = JSON.parse(open(sold_price_url).read)
  sleep(2)

  demographics_url = "https://api.propertydata.co.uk/demand?key=LKWVPEM1HL&postcode=W14=LKWVPEM1HL&postcode=#{POSTCODE[i]}"
  demographics = JSON.parse(open(demographics_url).read)
  sleep(2)

  price_url = "https://api.propertydata.co.uk/prices?key=LKWVPEM1HL&postcode=#{POSTCODE[i]}&bedrooms=2"
  price = JSON.parse(open(price_url).read)
  sleep(2)

  growth_url = "https://api.propertydata.co.uk/growth?key=LKWVPEM1HL&postcode=#{POSTCODE[i]}"
  growth = JSON.parse(open(growth_url).read)
  sleep(2)

  demand_url = "https://api.propertydata.co.uk/demand?key=LKWVPEM1HL&postcode=#{POSTCODE[i]}"
  demand = JSON.parse(open(demand_url).read)
  sleep(2)

  area = Area.new(
    name: AREA_NAMES[i],
    crime: crime,
    schools: school,
    sold_price: sold_price,
    demographics: demographics,
    price: price,
    demand: demand,
    growth: growth,
    average_deposit: AVERAGE_DEPOSIT[i],
    area_postcode: POSTCODE[i]
  )
  area.save!

  price = Price.new(
    area_id: area.id,
    amount:rand(170050..850250),
    year: rand(2000..2018)
  )
  price.save!

end

5.times do
  user = User.new(
    email: Faker::Internet.email,
    password: '123456',
    first_name: Faker::Name.name,
    last_name: Faker::Name.last_name,
    income: rand(39000..95000),
    credit_score: rand(300.. 850),
    date_of_birth:Faker::Date.birthday,
    deposit:rand(10000..30000),
    borrowing: rand(170050..850250),
  )
  user.save!
  counter = 0
end

5.times do |i|
  council_tax_url = "https://api.propertydata.co.uk/council-tax?key=LKWVPEM1HL&postcode=#{POSTCODE[i]}"
  council_tax = JSON.parse(open(council_tax_url).read)
  sleep(2)

  ptal_url = "https://api.propertydata.co.uk/ptal?key=LKWVPEM1HL&postcode=#{POSTCODE[i]}"
  ptal = JSON.parse(open(ptal_url).read)
  sleep(2)

  restaurants_url = "https://api.propertydata.co.uk/restaurants?key=LKWVPEM1HL&postcode=#{POSTCODE[i]}"
  restaurants = JSON.parse(open(restaurants_url).read)
  sleep(2)

  house = House.new(
    address: Faker::Address.street_address,
    postcode: POSTCODE[i],
    bedroom: rand(1..6),
    description: Faker::Lorem.paragraph(sentence_count: 2),
    bathroom: rand(1..2),
    square_feet:rand(100..300),
    council_tax: council_tax,
    ptal: ptal,
    green_belt: false, # or we could this instead [true, false].sample,
    area: Area.all[i],
    restaurants: restaurants     #Faker::Restaurant.name
  )
  house.save!
end

search = Search.new(
  gross_annual: rand(39000..95000),
  deposit: rand(10000..30000),
  distance_to_work: rand(10..120),
  school: [true, false].sample,
  user: User.first
)
search.save!



puts 'Finished!'
