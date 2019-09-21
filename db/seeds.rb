require 'faker'

require 'json'
require 'open-uri'

start_time = Time.now

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

areas = [
  { name: 'tower hamlets',
    postcode: 'E14 4QJ'
    },
  # average_deposit => 105051},
  {
    name: 'lambeth',
    postcode: 'SW2 1EG',
    # average_deposit => 82405
  },
  {
    name: 'wandsworth',
    postcode: "SW17 8TY",
    # average_deposit => 63540
  },
  {
    name: 'hackney',
    postcode: 'EC1Y 8ND',
    # average_deposit => 71013
  },
  {
    name: 'camden',
    postcode: 'NW3 3NT',
    # average_deposit => 92097
  }
]



areas.each do |area|
  p "Creating area"
  crime_url = "https://api.propertydata.co.uk/crime?key=94CJQWSHBG&postcode=#{area[:postcode]}"
  crime = JSON.parse(open(crime_url).read)
  sleep(3)

  school_url = "https://api.propertydata.co.uk/schools?key=94CJQWSHBG&postcode=#{area[:postcode]}"
  school = JSON.parse(open(school_url).read)
  sleep(3)

  sold_price_url = "https://api.propertydata.co.uk/sold-prices?key=94CJQWSHBG&postcode=#{area[:postcode]}&type=flat&max_age=12"
  sold_price = JSON.parse(open(sold_price_url).read)
  sleep(3)

  demographics_url = "https://api.propertydata.co.uk/demographics?key=94CJQWSHBG&postcode=W14=94CJQWSHBG&postcode=#{area[:postcode]}"
  demographics = JSON.parse(open(demographics_url).read)
  sleep(3)

  price_url = "https://api.propertydata.co.uk/prices?key=94CJQWSHBG&postcode=#{area[:postcode]}&bedrooms=2"
  price = JSON.parse(open(price_url).read)
  sleep(3)

  growth_url = "https://api.propertydata.co.uk/growth?key=94CJQWSHBG&postcode=#{area[:postcode]}"
  growth = JSON.parse(open(growth_url).read)
  sleep(3)

  demand_url = "https://api.propertydata.co.uk/demand?key=94CJQWSHBG&postcode=#{area[:postcode]}"
  demand = JSON.parse(open(demand_url).read)
  sleep(3)

  area = Area.new(
    name: area[:name],
    crime: crime,
    schools: school,
    sold_price: sold_price,
    demographics: demographics,
    price: price,
    demand: demand,
    growth: growth,
    # average_deposit: AVERAGE_DEPOSIT[i],
    area_postcode: area[:postcode]
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

photos = ["chelsea_stephen_bayley.jpg", "jube6.jpg", "Marian-Court-620.jpg", "semi-detached-425x265-425x239.jpg", "house1.jpg", "house2.jpg", "house3.jpg", "house4.jpg", "house5.jpg", "house6.jpg"]

Area.all.each_with_index do |area, i|
  p "Creating house x2"
  council_tax_url = "https://api.propertydata.co.uk/council-tax?key=94CJQWSHBG&postcode=#{area.area_postcode}"
  council_tax = JSON.parse(open(council_tax_url).read)
  sleep(3)

  ptal_url = "https://api.propertydata.co.uk/ptal?key=94CJQWSHBG&postcode=#{area.area_postcode}"
  ptal = JSON.parse(open(ptal_url).read)
  sleep(3)

  restaurants_url = "https://api.propertydata.co.uk/restaurants?key=94CJQWSHBG&postcode=#{area.area_postcode}"
  restaurants = JSON.parse(open(restaurants_url).read)
  sleep(3)

  unless i > 5
    2.times do
      area_data = area.sold_price["data"]["raw_data"].sample
      # area.sold_price["data"]["raw_data"].first(3).each do |house_hash|
        house = House.new(
          address: area_data["address"],
          postcode: area_data["address"].split(", ").last,
          bedroom: rand(1..6),
          description: Faker::Lorem.paragraph(sentence_count: 2),
          bathroom: rand(1..2),
          square_feet:rand(100..300),
          council_tax: council_tax,
          ptal: ptal,
          green_belt: false, # or we could this instead [true, false].sample,
          area: area,
          restaurants: restaurants,
          price: area_data["price"],
          photo: photos.pop    #Faker::Restaurant.name
        )
        house.save
        p house
        p house.errors.messages
    # end
    end
  end
end

search = Search.new(
  gross_annual: rand(39000..95000),
  deposit: rand(10000..30000),
  distance_to_work: rand(10..120),
  school: [true, false].sample,
  user: User.first
)
search.save!

end_time = Time.now

total_time = end_time - start_time

puts "Finished in #{total_time} seconds!"
