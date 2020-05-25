# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'open-uri'

puts "Deleting users.."
User.destroy_all
puts "Adding users..."

p user_one = User.create!(username: "florence", email: "florence@gmail.com", password: "1234567")
p user_two = User.create!(username: "ellie", email: "ellie@gmail.com", password: "1234567")
p user_three = User.create!(username: "guillaume", email: "guillaume@gmail.com", password: "1234567")
p user_four = User.create!(username: "phaedon", email: "phaedon@gmail.com", password: "1234567")

puts "creating trip.."

p trip_one = Trip.new(
  destination: "Canada",
  start_date: DateTime.new(2020,25,8,21), # the last one is the hour
  end_date: DateTime.new(2020,10,9,20),
  budget: 2000
  interests: "mountain hiking, natural wonders"
  # creator_id: 3 # or user_three?
  )
trip_one.save

puts "creating some profiles.."

p profile_1 = Profile.new(
  first_name: "",
  last_name: "",
  age: ,
  gender: "",
  picture: ,
  location: "")
