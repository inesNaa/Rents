# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require 'faker'
puts "Destroying database"
User.destroy_all
Car.destroy_all
Booking.destroy_all

puts "Creating users"

user1 = User.create(
  email: "dorsaf@gmail.com",
  password: 345678,
  first_name: "dorsaf",
  last_name: "naamane",
  phone_number: "0762231240",
  license_plate: Faker::Vehicle.license_plate
)

user2 = User.create(
  email: "najet@gmail.com",
  password: 123456,
  first_name: "najet",
  last_name: "naamane",
  phone_number: "0762231241",
  license_plate: Faker::Vehicle.license_plate
)

user3 = User.create(
  email: "mekki@gmail.com",
  password: 987654,
  first_name: "mekki",
  last_name: "naamane",
  phone_number: "0762231245",
  license_plate: Faker::Vehicle.license_plate
)

puts "users created"
puts "creating cars"

24.times do
  car = Car.new(
    description: "Le Lorem Ipsum est simplement du faux texte employé dans la composition et la mise en page avant impression.
    Le Lorem Ipsum est le faux texte standard de l'imprimerie depuis les années 1500, quand un imprimeur anonyme
    assembla ensemble des morceaux de texte pour réaliser un livre spécimen de polices de texte. ",
    brand: Faker::Vehicle.make,
    model: Faker::Vehicle.model,
    year: Faker::Vehicle.year,
    city: Faker::Address.city,
    mileage: Faker::Vehicle.mileage,
    fuel: Faker::Vehicle.fuel_type,
    type_of_vehicle: Faker::Vehicle.car_type,
    price_per_day: Faker::Number.within(range: 30..200),
    user_id: user3.id
  )
  car.save!
end

puts "finished"
