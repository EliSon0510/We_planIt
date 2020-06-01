# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

#require 'random'

require 'open-uri'
include Rails.application.routes.url_helpers
require 'faker'
require 'time'
require 'json'

puts "Deleting users.."
User.destroy_all

puts "Deleting trips.."
Trip.destroy_all

puts "Deleting profiles.."
Profile.destroy_all

puts "Deleting reviews.."
Review.destroy_all

puts "Deleting interests.."
Interest.destroy_all

puts "Creating interests.."

filepath = 'interests.json'
ser_interests = File.read(filepath)
interests = JSON.parse(ser_interests)
# random_interest = JSON.parse(open"#{Rails.root}/interests.json").read

interests.each do |inter|
  Interest.create!(inter)
end

puts "Created Interests.."

#10.times do
#  p  Interest.create!(name: Faker::Hipster.word)
#end

puts "Adding users..."

p user_one = User.create!(email: "florence@gmail.com", password: "1234567", nickname: "Flo")
p user_two = User.create!(email: "ellie@gmail.com", password: "1234567", nickname: "Ellie")
p user_three = User.create!(email: "guillaume@gmail.com", password: "1234567", nickname: "Guigui")
p user_four = User.create!(email: "phaedon@gmail.com", password: "1234567", nickname: "MrNo")

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

puts "Creating some trips.."

p trip_one = Trip.new(
  destination: "Canada",
  start_date: Date.parse("2020 December 15"),
  end_date: Date.parse("2020 December 25"),
  budget: 840,
  user: User.third,
  interests: [Interest.first, Interest.last]
)

trip_one.save!

p trip_two = Trip.new(
  destination: "Greece",
  start_date: Date.parse("2019 May 15"),
  end_date: Date.parse("2019 May 25"),
  budget: 600,
  user: User.last,
  interests: [Interest.first, Interest.last] #ran_inter #interests.sample[1]#"Activism" # interests.values_at.sample
)

trip_two.save!

p trip_three = Trip.new(
  destination: "United Kingdom",
  start_date: Date.parse("2021 April 15"),
  end_date: Date.parse("2020 April 25"),
  budget: 900,
  user: User.first,
  interests: [Interest.first, Interest.last] #ran_inter #interests.sample[1]#"Activism" # interests.values_at.sample
)

trip_three.save!

p trip_four = Trip.new(
  destination: "New York",
  start_date: Date.parse("2018 January 15"),
  end_date: Date.parse("2018 January 25"),
  budget: 1100,
  user: User.first,
  interests: Interest.all.shuffle[0..2]
  interests: [Interest.first, Interest.last] #ran_inter #interests.sample[1]#"Activism" # interests.values_at.sample
)

trip_four.save!

p trip_five = Trip.new(
  destination: "Cuba",
  start_date: Date.parse("2019 June 15"),
  end_date: Date.parse("2019 July 25"),
  budget: 840,
  user: User.second,
  interests: Interest.all.shuffle[0..2]
)

trip_five.save!

p trip_six = Trip.new(
  destination: "Niger",
  start_date: Date.parse("2022 June 15"),
  end_date: Date.parse("2022 July 25"),
  budget: 400,
  user: User.second,
  interests: Interest.all.shuffle[0..2]
)

trip_six.save!

p trip_seven = Trip.new(
  destination: "Peru",
  start_date: Date.parse("2021 June 15"),
  end_date: Date.parse("2021 July 25"),
  budget: 732,
  user: User.second,
  interests: Interest.all.shuffle.[0..2]
)

trip_seven.save!

p trip_eight = Trip.new(
  destination: "Costa Rica",
  start_date: Date.parse("2020 June 15"),
  end_date: Date.parse("2020 August 25"),
  budget: 640,
  user: User.second,
  interests: Interest.all.shuffle[0..2]
)

trip_eight.save!

p trip_nine = Trip.new(
  destination: "Croatia",
  start_date: Date.parse("2021 Octomber 08"),
  end_date: Date.parse("2021 January 03"),
  budget: 420,
  user: User.third,
  interests: Interest.all.shuffle[0..2]
)

trip_nine.save!

p trip_ten = Trip.new(
  destination: "Thailand",
  start_date: Date.parse("2022 May 26"),
  end_date: Date.parse("2022 July 06"),
  budget: 400,
  user: User.first,
  interests: Interest.all.shuffle[0..2]
)

trip_ten.save!

p trip_eleven = Trip.new(
  destination: "Santorini",
  start_date: Date.parse("2020 June 25"),
  end_date: Date.parse("2020 July 25"),
  budget: 700,
  user: User.fourth,
  interests: Interest.all.shuffle[5..6]
)

trip_eleven.save!

p trip_twelve = Trip.new(
  destination: "Turkey",
  start_date: Date.parse("2021 April 05"),
  end_date: Date.parse("2022 April 23"),
  budget: 420,
  user: User.first,
  interests: Interest.all.shuffle[5..6]
)

trip_twelve.save!

p trip_thirteen = Trip.new(
  destination: "Italy",
  start_date: Date.parse("2022 November 09"),
  end_date: Date.parse("2022 November 28"),
  budget: 600,
  user: User.first,
  interests: Interest.all.shuffle[5..6]
)

trip_thirteen.save!

p trip_fourteen = Trip.new(
  destination: "Ireland",
  start_date: Date.parse("2021 March 06"),
  end_date: Date.parse("2021 April 10"),
  budget: 400,
  user: User.third,
  interests: Interest.all.shuffle[3..6]
)

trip_fourteen.save!

p trip_fifteen = Trip.new(
  destination: "Ireland",
  start_date: Date.parse("2021 April 12"),
  end_date: Date.parse("2021 May 27"),
  budget: 549,
  user: User.first,
  interests: Interest.all.shuffle[4..6]
)

trip_fifteen.save!

p trip_sixteen = Trip.new(
  destination: "Samothraki",
  start_date: Date.parse("202 June 26"),
  end_date: Date.parse("2021 July 23"),
  budget: 200,
  user: User.fourth,
  interests: Interest.all.shuffle[0..6]
)

trip_sixteen.save!

puts "Created some trips.."

puts "Finished"

