# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'
City.destroy_all
Dog.destroy_all
Dogsitter.destroy_all
Stroll.destroy_all

5.times do |c|
  City.create(name: Faker::Address.city)
end
cities_list = City.all

10.times do |d|
  c = cities_list.sample
  Dog.create(name: Faker::Creature::Dog.name, breed: Faker::Creature::Dog.breed, city_id: c.id)
end
dogs_list = Dog.all

10.times do |s|
  c = cities_list.sample
  Dogsitter.create(name: Faker::Superhero.name, city_id: c.id)
end
sitters_list = Dogsitter.all

20.times do
  c = cities_list.sample
  # d = dogs_list.sample
  # s = sitters_list.sample
  Stroll.create(date: Faker::Date.between(from: '2021-06-23', to: '2021-09-25'), city_id: c.id, dog_id: Dog.all.sample.id, dogsitter_id: Dogsitter.all.sample.id)
end
