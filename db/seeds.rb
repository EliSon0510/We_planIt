# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'open-uri'
include Rails.application.routes.url_helpers

puts "Deleting users.."
Profile.destroy_all
User.destroy_all
# Review.destroy_all
puts "Adding users..."

p user_one = User.create!(email: "florence@gmail.com", password: "1234567")
p user_two = User.create!(email: "ellie@gmail.com", password: "1234567")
p user_three = User.create!(email: "guillaume@gmail.com", password: "1234567")
p user_four = User.create!(email: "phaedon@gmail.com", password: "1234567")

puts "Finished with users!"

puts "creating some profiles.."

p profile_1 = Profile.new(
  first_name: "Florence",
  last_name: "Carlier",
  age: 22,
  gender: "female",
  location: "Namur, Belgium"
  )

profile_1.user_id = user_one.id
pic_1 = File.open(File.join(Rails.root, "/app/assets/images/profile_1.jpg"))
profile_1.photo.attach(io: pic_1, filename: 'image.png', content_type: 'image/png')
#pic_1 = URI.open("https://www.sunflowerhospital.in/wp-content/uploads/2017/09/profile-img.jpg")
profile_1.save!

#pic_2 = File.read('./app/assets/images/profile_2.jpg')


pic_2 = File.open(File.join(Rails.root, "/app/assets/images/profile_2.jpg"))

p profile_2 = Profile.new(
  first_name: "Ellie",
  last_name: "Son",
  age: 29,
  gender: "female",
  location: "Belgium"
  )

profile_2.user_id = user_two.id
#pic_2 = URI.open("https://www.sunflowerhospital.in/wp-content/uploads/2017/09/profile-img.jpg")
profile_2.photo.attach(io: pic_2, filename: 'image.png', content_type: 'image/png')
profile_2.save!

pic_3 = File.open(File.join(Rails.root, "/app/assets/images/profile_3.jpg"))

p profile_3 = Profile.new(
  first_name: "Guillaume",
  last_name: "de Crombrugghe",
  age: 21,
  gender: "male",
  location: "Belgium"
  )

profile_3.user_id = user_three.id
#pic_3 = URI.open("https://www.jennstrends.com/wp-content/uploads/2013/10/bad-profile-pic-2-768x768.jpeg")
profile_3.photo.attach(io: pic_3, filename: 'image.png', content_type: 'image/png')
profile_3.save!

pic_4 = File.open(File.join(Rails.root, "/app/assets/images/profile_4.jpg"))

p profile_4 = Profile.new(
  first_name: "Phaedon",
  last_name: "Val",
  age: 35,
  gender: "male",
  location: "Greece"
  )

profile_4.user_id = user_four.id
#pic_4 = URI.open("https://www.jennstrends.com/wp-content/uploads/2013/10/bad-profile-pic-2-768x768.jpeg")

profile_4.photo.attach(io: pic_4, filename: 'image.png', content_type: 'image/png')
profile_4.save!

#puts "creating trip.."

#p trip_one = Trip.new(
#  destination: "Canada",
#  start_date: DateTime.new(2020,25,8,21), # the last one is the hour
#  end_date: DateTime.new(2020,10,9,20),
#  budget: 2000,
#  interests: "mountain hiking, natural wonders"

# )
#trip_one.save!

puts "Finished"
