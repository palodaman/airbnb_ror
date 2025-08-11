# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

user = User.create!({
    email: 'test123@gmail.com',
    password: '123456'
})

6.times do |i|
    property = Property.create!({
    name: Faker::FunnyName.two_word_name,
    headline: Faker::Lorem.unique.sentence(word_count: 6),
    description: Faker::Lorem.paragraph(sentence_count: 10),
    address_1: Faker::Address.street_address,
    address_2: Faker::Address.secondary_address,
    city: Faker::Address.city,
    state: Faker::Address.state,
    country: Faker::Address.country,
    price: Money.from_amount((50..100).to_a.sample, 'USD'),

}) 
    # craeted a property variable for referencing down here
    property.images.attach(io: File.open("db/images/property_#{i +1}.png"), filename: property.name)
    property.images.attach(io: File.open("db/images/property_#{i +7}.png"), filename: property.name)

# add dummy data for review - 5 to 10 reviews for each airbnb property
# createa a user so it can be used below
    ((5..10).to_a.sample).times do
        Review.create!({
            feedback: Faker::Lorem.paragraph(sentence_count: 10),
            cleanliness_rating: (1..5).to_a.sample,
            accuracy_rating: (1..5).to_a.sample,
            checkin_rating: (1..5).to_a.sample,
            communication_rating: (1..5).to_a.sample,
            location_rating: (1..5).to_a.sample,
            value_rating: (1..5).to_a.sample,
            property: property,
            user: user #from above
        })
    end

end