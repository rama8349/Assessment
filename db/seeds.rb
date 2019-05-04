# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

if ['development', 'test'].include?(Rails.env)
	require 'faker'
	1000.times do
		Location.create(city: Faker::Address.city, address:  Faker::Address.street_address)
		# if Faker::Address.country == 'United States of America'
	end
end
