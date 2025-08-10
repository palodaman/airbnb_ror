# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

Property.create!({
    name: 'Sample property',
    headline: 'Sample headline',
    description: 'Sample description',
    address_1: '123 Main St',
    address_2: 'Apt 1',
    city: 'Sample City',
    state: 'Sample State',
    country: 'Sample Country'
}) 

Property.create!({
    name: 'Sample property 2',
    headline: 'Sample headline',
    description: 'Sample description 2',
    address_1: '123 Main St',
    address_2: 'Apt 1',
    city: 'Sample City 2',
    state: 'Sample State 2',
    country: 'Sample Country'
})