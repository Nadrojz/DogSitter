# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

City.destroy_all
5.times do |index|
  City.create!(
  city_name: Faker::Address.city)
end

Dogsitter.destroy_all
50.times do |index|
  Dogsitter.create!(
  name: Faker::Name.name,
  city: City.all.sample)
end

Dog.destroy_all
20.times do |index|
  Dog.create!(
  name: Faker::Creature::Dog.name,
  city: City.all.sample)
end


# Stroll.destroy_all
# 10.times do |index|
#   Stroll.create!(
#     date: Faker::Time.forward(days: 30, period: :day).to_datetime,
#     while dogsitter_match != dog_match
#       dogsitter_sample
#       dog_sample
#     end
# end

10.times do |index|
  dogsitter_match = Dogsitter.all.sample
  dog_match = Dog.all.sample
  while dogsitter_match.city != dog_match.city
    dog_match = Dog.all.sample
  end
  Stroll.create!(
    dogsitter: dogsitter_match,
    dog: dog_match,
    date: Faker::Time.forward(days: 30, period: :day).to_datetime
    )
  end
