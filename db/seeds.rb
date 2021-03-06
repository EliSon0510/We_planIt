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
p user_five = User.create!(email: "picklerick@gmail.com", password: "1234567", nickname: "gkosmo")
p user_six = User.create!(email: "tarig@gmail.com", password: "1234567", nickname: "Tarig")
p user_seven = User.create!(email: "testuser@gmail.com", password: "1234567", nickname: "anon user")

puts "Finished with users!"

puts "creating some profiles.."

p profile_1 = Profile.new(
  first_name: "Florence",
  last_name: "Carlier",
  age: 22,
  gender: "female",
  description: "Enjoying life at the fullest everywhere I go! Love to meet new people and to share memories with them!",
  location: "Namur, Belgium"
  )
profile_1.user_id = user_one.id
pic_1 = File.open(File.join(Rails.root, "/app/assets/images/profile_1.jpg"))
profile_1.photo.attach(io: pic_1, filename: 'image.png', content_type: 'image/png')
profile_1.save!

pic_2 = File.open(File.join(Rails.root, "/app/assets/images/profile_2.jpg"))
p profile_2 = Profile.new(
  first_name: "Ellie",
  last_name: "Son",
  age: 29,
  gender: "female",
  description: "Open-minded and positive girl that loves to meet new people and have fun around the world!",
  location: "Belgium"
  )
profile_2.user_id = user_two.id
profile_2.photo.attach(io: pic_2, filename: 'image.png', content_type: 'image/png')
profile_2.save!

pic_3 = File.open(File.join(Rails.root, "/app/assets/images/profile_3.jpg"))
p profile_3 = Profile.new(
  first_name: "Guillaume",
  last_name: "de Crombrugghe",
  age: 21,
  gender: "male",
  description: "I love going on adventure and living the wild life!",
  location: "Belgium"
  )
profile_3.user_id = user_three.id
profile_3.photo.attach(io: pic_3, filename: 'image.png', content_type: 'image/png')
profile_3.save!

pic_4 = File.open(File.join(Rails.root, "/app/assets/images/profile_4.jpg"))
p profile_4 = Profile.new(
  first_name: "Phaedon",
  last_name: "Val",
  age: 35,
  gender: "male",
  description: "My goal in life is to travel as mush as money affords me to...",
  location: "Greece"
  )
profile_4.user_id = user_four.id
profile_4.photo.attach(io: pic_4, filename: 'image.png', content_type: 'image/png')
profile_4.save!

pic_5 = File.open(File.join(Rails.root, "/app/assets/images/profile_5.jpg"))
p profile_5 = Profile.new(
  first_name: "G",
  last_name: "Kosmo",
  age: 26,
  gender: "male",
  description: "I love discovering new locations to travel to! I also like coding remotely on my trips!",
  location: "Brussels"
  )
profile_5.user_id = user_five.id
profile_5.photo.attach(io: pic_5, filename: 'image.png', content_type: 'image/png')
profile_5.save!

pic_6 = File.open(File.join(Rails.root, "/app/assets/images/profile_6.png"))
p profile_6 = Profile.new(
  first_name: "Tarig",
  last_name: "B",
  age: 24,
  gender: "male",
  description: "Travelling is great! Meeting bright new people even greater!",
  location: "Brussels"
  )
profile_6.user_id = user_six.id
profile_6.photo.attach(io: pic_6, filename: 'image.png', content_type: 'image/png')
profile_6.save!

puts "Finished with profiles.."

puts "Creating reviews...."

p review_1 = Review.new(
  content: "I think she likes travelling.. also funny to travel with!",
  rating: 5,
  user: User.third,
  profile: Profile.first
  )
review_1.save!

p review_2 = Review.new(
  content: "Had travelled a lot! I would definetely recommend her.",
  rating: 5,
  user: user_four,
  profile: profile_2
  )
review_2.save!

p review_3 = Review.new(
  content: "Seems nice and funny guy!",
  rating: 5,
  user: user_one,
  profile: profile_3
  )
review_3.save!

p review_4 = Review.new(
  content: "Seems nice lad but he doesn't speak a lot.",
  rating: 5,
  user: user_two,
  profile: profile_4
  )
review_4.save!

p review_5 = Review.new(
  content: "We spend a lot of creative time while hiking on Alps.. I would definetely travel again with her!",
  rating: 5,
  user: user_five,
  profile: profile_1
  )
review_5.save!

p review_6 = Review.new(
  content: "It was a great sailing trip in Spain! She also paid a lot of our meals!",
  rating: 5,
  user: user_three,
  profile: profile_2
  )
review_6.save!

p review_7 = Review.new(
  content: "Interesting guy! Also very helpful as we traveled to London using his own car.",
  rating: 5,
  user: user_four,
  profile: profile_3
  )
review_7.save!

p review_8 = Review.new(
  content: "We did some hiking on a greek island. It was nice but sometimes he doesn't seem to realize danger.. ",
  rating: 3,
  user: user_three,
  profile: profile_4
  )
review_8.save!

p review_9 = Review.new(
  content: "We visited Germany for a concert! Actually this trip made us great friends!",
  rating: 4,
  user: user_four,
  profile: profile_1
  )
review_9.save!

p review_10 = Review.new(
  content: "Awesome person! We had such a great time on our trip to Spain!",
  rating: 5,
  user: user_six,
  profile: profile_1
  )
review_10.save!

puts "Finished with reviews.."

puts "Creating some trips.."

p trip_one = Trip.new(
  destination: "East York Ontario Canada",
  start_date: Date.parse("2020 December 15"),
  end_date: Date.parse("2020 December 25"),
  budget: 840,
  user: user_three,
  interests: [Interest.all.shuffle.first, Interest.all.shuffle.first]
)
pic_1 = File.open(File.join(Rails.root, "/app/assets/images/prototype_trip_photos/Canada.jpg"))
trip_one.photo.attach(io: pic_1, filename: 'image.png', content_type: 'image/png')

trip_one.save!

p trip_two = Trip.new(
  destination: "Athens Greece",
  start_date: Date.parse("2019 May 15"),
  end_date: Date.parse("2019 May 25"),
  budget: 600,
  user: user_four,
  interests: [Interest.all.shuffle.first, Interest.all.shuffle.first]
)
pic_2 = File.open(File.join(Rails.root, "/app/assets/images/prototype_trip_photos/Athens.jpg"))
trip_two.photo.attach(io: pic_2, filename: 'image.png', content_type: 'image/png')

trip_two.save!

p trip_three = Trip.new(
  destination: "City of London England United Kingdom",
  start_date: Date.parse("2021 April 15"),
  end_date: Date.parse("2021 April 25"),
  budget: 900,
  user: user_one,
  interests: [Interest.all.shuffle.first, Interest.all.shuffle.first]
)
pic_3 = File.open(File.join(Rails.root, "/app/assets/images/prototype_trip_photos/London.jpg"))
trip_three.photo.attach(io: pic_3, filename: 'image.png', content_type: 'image/png')

trip_three.save!

p trip_four = Trip.new(
  destination: "New York United States of America",
  start_date: Date.parse("2018 January 15"),
  end_date: Date.parse("2018 January 25"),
  budget: 1100,
  user: user_one,
  interests: [Interest.all.shuffle.first, Interest.all.shuffle.first]
)
pic_4 = File.open(File.join(Rails.root, "/app/assets/images/prototype_trip_photos/NY.jpg"))
trip_four.photo.attach(io: pic_4, filename: 'image.png', content_type: 'image/png')

trip_four.save!

p trip_five = Trip.new(
  destination: "Santiago de cuba Cuba",
  start_date: Date.parse("2019 June 15"),
  end_date: Date.parse("2019 July 25"),
  budget: 840,
  user: user_five,
  interests: [Interest.all.shuffle.first, Interest.all.shuffle.first]
  )
pic_5 = File.open(File.join(Rails.root, "/app/assets/images/prototype_trip_photos/Cuba.jpg"))
trip_five.photo.attach(io: pic_5, filename: 'image.png', content_type: 'image/png')

trip_five.save!

p trip_six = Trip.new(
  destination: "Negeriagung Negeri Agung Lampung Indonesia",
  start_date: Date.parse("2022 June 15"),
  end_date: Date.parse("2022 July 25"),
  budget: 400,
  user: user_two,
  interests: [Interest.all.shuffle.first, Interest.all.shuffle.first]
)
pic_6 = File.open(File.join(Rails.root, "/app/assets/images/prototype_trip_photos/Nigeria.jpg"))
trip_six.photo.attach(io: pic_6, filename: 'image.png', content_type: 'image/png')

trip_six.save!

p trip_seven = Trip.new(
  destination: "Lima Peru",
  start_date: Date.parse("2021 June 15"),
  end_date: Date.parse("2021 July 25"),
  budget: 732,
  user: user_two,
  interests: [Interest.all.shuffle.first, Interest.all.shuffle.first]
)
pic_7 = File.open(File.join(Rails.root, "/app/assets/images/prototype_trip_photos/Peru.jpg"))
trip_seven.photo.attach(io: pic_7, filename: 'image.png', content_type: 'image/png')

trip_seven.save!

p trip_eight = Trip.new(
  destination: "Costa Rica Sinaloa Mexico",
  start_date: Date.parse("2020 June 15"),
  end_date: Date.parse("2020 August 25"),
  budget: 640,
  user: user_two,
  interests: [Interest.all.shuffle.first, Interest.all.shuffle.first]
)
pic_8 = File.open(File.join(Rails.root, "/app/assets/images/prototype_trip_photos/Costa_Rica.jpg"))
trip_eight.photo.attach(io: pic_8, filename: 'image.png', content_type: 'image/png')

trip_eight.save!

p trip_nine = Trip.new(
  destination: "Zagreb City of Zagreb Croatia",
  start_date: Date.parse("2021 Octomber 08"),
  end_date: Date.parse("2021 January 03"),
  budget: 420,
  user: user_three,
  interests: [Interest.all.shuffle.first, Interest.all.shuffle.first]
)
pic_9 = File.open(File.join(Rails.root, "/app/assets/images/prototype_trip_photos/Croatia.jpg"))
trip_nine.photo.attach(io: pic_9, filename: 'image.png', content_type: 'image/png')

trip_nine.save!

p trip_ten = Trip.new(
  destination: "Bangkok Thailand",
  start_date: Date.parse("2022 May 26"),
  end_date: Date.parse("2022 July 06"),
  budget: 400,
  user: user_one,
  interests: [Interest.first, Interest.last]
)
pic_10 = File.open(File.join(Rails.root, "/app/assets/images/prototype_trip_photos/Thailand.jpg"))
trip_ten.photo.attach(io: pic_10, filename: 'image.png', content_type: 'image/png')

trip_ten.save!

p trip_eleven = Trip.new(
  destination: "Santorini Thira Municipal Unit Greece",
  start_date: Date.parse("2020 June 25"),
  end_date: Date.parse("2020 July 25"),
  budget: 700,
  user: user_two,
  interests: [Interest.all.shuffle.first, Interest.all.shuffle.first]
)
pic_11 = File.open(File.join(Rails.root, "/app/assets/images/prototype_trip_photos/Santorini.jpg"))
trip_eleven.photo.attach(io: pic_11, filename: 'image.png', content_type: 'image/png')

trip_eleven.save!

p trip_twelve = Trip.new(
  destination: "Bursa Turkey",
  start_date: Date.parse("2021 April 05"),
  end_date: Date.parse("2021 April 23"),
  budget: 420,
  user: user_five,
  interests: [Interest.all.shuffle.first, Interest.all.shuffle.first]
)
pic_12 = File.open(File.join(Rails.root, "/app/assets/images/prototype_trip_photos/Turkey.jpg"))
trip_twelve.photo.attach(io: pic_12, filename: 'image.png', content_type: 'image/png')

trip_twelve.save!

p trip_thirteen = Trip.new(
  destination: "Venice Veneto Italy",
  start_date: Date.parse("2022 November 09"),
  end_date: Date.parse("2022 November 28"),
  budget: 600,
  user: user_one,
  interests: [Interest.all.shuffle.first, Interest.all.shuffle.first]
)
pic_13 = File.open(File.join(Rails.root, "/app/assets/images/prototype_trip_photos/Italy.jpg"))
trip_thirteen.photo.attach(io: pic_13, filename: 'image.png', content_type: 'image/png')

trip_thirteen.save!

p trip_fourteen = Trip.new(
  destination: "Belfast Northern Ireland United Kingdom",
  start_date: Date.parse("2021 March 06"),
  end_date: Date.parse("2021 April 10"),
  budget: 400,
  user: user_three,
  interests: [Interest.all.shuffle.first, Interest.all.shuffle.first]
)
pic_14 = File.open(File.join(Rails.root, "/app/assets/images/prototype_trip_photos/Ireland_2.jpg"))
trip_fourteen.photo.attach(io: pic_14, filename: 'image.png', content_type: 'image/png')

trip_fourteen.save!

p trip_fifteen = Trip.new(
  destination: "Dublin Leinster Ireland",
  start_date: Date.parse("2021 April 12"),
  end_date: Date.parse("2021 May 27"),
  budget: 549,
  user: user_one,
  interests: [Interest.all.shuffle.first, Interest.all.shuffle.first]
)
pic_15 = File.open(File.join(Rails.root, "/app/assets/images/prototype_trip_photos/Ireland.jpg"))
trip_fifteen.photo.attach(io: pic_15, filename: 'image.png', content_type: 'image/png')

trip_fifteen.save!

p trip_sixteen = Trip.new(
  destination: "Samothraki Greece",
  start_date: Date.parse("2020 June 26"),
  end_date: Date.parse("2020 July 23"),
  budget: 200,
  user: user_four,
  interests: [Interest.all.shuffle.first, Interest.all.shuffle.first]
)
pic_16 = File.open(File.join(Rails.root, "/app/assets/images/prototype_trip_photos/Samothraki.jpg"))
trip_sixteen.photo.attach(io: pic_16, filename: 'image.png', content_type: 'image/png')

trip_sixteen.save!

p trip_seventeen = Trip.new(
  destination: "Mykonos Greece",
  start_date: Date.parse("2020 July 26"),
  end_date: Date.parse("2020 August 23"),
  budget: 830,
  user: user_three,
  interests: [Interest.all.shuffle.first, Interest.all.shuffle.first]
)
pic_17 = File.open(File.join(Rails.root, "/app/assets/images/prototype_trip_photos/Mykonos.jpg"))
trip_seventeen.photo.attach(io: pic_17, filename: 'image.png', content_type: 'image/png')

trip_seventeen.save!

p test_trip = Trip.new(
  destination: "8th Avenue East Bradenton Florida United States of America",
  start_date: Date.parse("2020 July 26"),
  end_date: Date.parse("2020 August 23"),
  budget: 50,
  user: user_one,
  interests: [Interest.all.shuffle.first, Interest.all.shuffle.first]
)
pic_18 = File.open(File.join(Rails.root, "/app/assets/images/prototype_trip_photos/Florida.jpg"))
test_trip.photo.attach(io: pic_18, filename: 'image.png', content_type: 'image/png')

test_trip.save!

puts "Created some trips.."

puts "All done!"

