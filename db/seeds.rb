# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require 'faker'
puts "Destroying database"
Car.destroy_all
User.destroy_all

puts "Creating users"

user1 = User.create(
  email: "dorsaf@gmail.com",
  password: 345678,
  first_name: "dorsaf",
  last_name: "naamane"
)

user2 = User.create(
  email: "najet@gmail.com",
  password: 123456,
  first_name: "najet",
  last_name: "naamane"
)

user3 = User.create(
  email: "mekki@gmail.com",
  password: 987654,
  first_name: "mekki",
  last_name: "naamane"
)

12.times do
  car = Car.new(
    brand: Faker::Vehicle.make,
    model: Faker::Vehicle.model,
    year: Faker::Vehicle.year,
    price_per_day: Faker::Number.within(range: 30..200),
    user_id: user3.id
  )
  car.save!
end
