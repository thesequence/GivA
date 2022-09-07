# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require "open-uri"

require "faker"

puts "deleting database"

UserTag.delete_all
Tag.delete_all
Buddy.delete_all
User.delete_all

Location.delete_all

puts "seeding database"

titles = %w[accomodation paperwork language job doctor kindergarden school police Ausländerbehörde visa immigration insurance]
# titles.each do |title|
tag = Tag.new(
  title: titles.sample(2)
)
tag.save!
tag = Tag.new(
  title: titles.sample(4)
)
tag.save!
tag = Tag.new(
  title: titles.sample(3)
)
tag.save!
tag = Tag.new(
  title: titles.sample(3)
)
tag.save!
tag = Tag.new(
  title: titles.sample(3)
)
tag.save!
tag = Tag.new(
  title: titles.sample(3)
)
tag.save!
tag = Tag.new(
  title: titles.sample(3)
)
tag.save!
tag = Tag.new(
  title: titles.sample(3)
)
tag.save!
tag = Tag.new(
  title: titles.sample(3)
)
tag.save!
tag = Tag.new(
  title: titles.sample(3)
)
tag.save!
# end
puts "created title tags"


# generate 10 female users
(1..10).each do |id|
  bio_array = [
    "I am a refugee from Syria and I have been living in the camp for four years. I need help with school for my children and a place to stay.",
    "I am a parent, I work in IT, I have experience in gastronomy, I live with my family in the countryside, I love to travel and read books and eat food.",
    "I am a refugee who arrived in Germany in 2022. I have been working since then for restaurants and event industry. I am the parent of four kids and I love cars, nature trips and anything that makes my life more interesting.",
    "I am a refugee from Syria. I have been in Germany for two years now and have been working in the movie industry. I live with my two dogs and would love to meet new people.",
    "I am a parent, refugee from Ukraine. I am passionate about nature, my family and Sunday movies. I am not a stranger to the hardships of life. I am here to give my best and try to find peace in this world.",
    "I am a refugee from Ukraine and have been living in Germany for two years. I am working as an economist and enjoy spending my free time with my pets.",
    "I have a passion for trading and economics, which led me to work in the financial market. I love the outdoors but also enjoy hearing about the lives of others. I am a vegetarian and am very attentive to the needs of animals.",
    "I am a political refugee from the ME. social activist. hope to make this world better. i worked in theater and media and would like to continue this route",
    "I moved here 2 months ago when the war started. I am a parent of 3. we love trips in the woods and playing with our dog. I worked as a cook and had my own restaurant.",
    "Political refugee from Eastern Europe. just arrived here and need accomodation. I am a student of philosophy, about to major. worked in libraries and at university as TA."
  ]

  female_pics = [
    "https://res.cloudinary.com/dbgvo56a1/image/upload/v1661951077/females/90_myxkbl.jpg",
    "https://res.cloudinary.com/dbgvo56a1/image/upload/v1661951077/females/6_cymxbh.jpg",
    "https://res.cloudinary.com/dbgvo56a1/image/upload/v1661951077/females/88_u0pbhh.jpg",
    "https://res.cloudinary.com/dbgvo56a1/image/upload/v1661951077/females/94_iyoynq.jpg",
    "https://res.cloudinary.com/dbgvo56a1/image/upload/v1661951077/females/62_llpb8x.jpg",
    "https://res.cloudinary.com/dbgvo56a1/image/upload/v1661951077/females/48_dbpiid.jpg",
    "https://res.cloudinary.com/dbgvo56a1/image/upload/v1661951077/females/22_vqynva.jpg",
    "https://res.cloudinary.com/dbgvo56a1/image/upload/v1661951077/females/2_gxh81f.jpg",
    "https://res.cloudinary.com/dbgvo56a1/image/upload/v1661951077/females/67_e3xhzc.jpg",
    "https://res.cloudinary.com/dbgvo56a1/image/upload/v1661951077/females/65_ozf3z6.jpg"
  ]

  flags = %w[English Ukrainian German Arabic Vietnamese Turkish French]
  user = User.new(

    # each user is assigned an id from 1-10
    name: Faker::Name.female_first_name,
    email: "test#{id}@giva.com",

    # issue each user the same password
    password: "password",
    password_confirmation: "password",

    # a user can have only one of these roles
    displaced: Faker::Boolean.boolean(true_ratio: 0.5),

    # random bio and problem (if displaced = true) is assigned to user

    # bio: Faker::Lorem.paragraph(sentence_count: 6),
    bio: bio_array[id - 1]
    # tag: Tag.first
  )
  user.photo.attach(io: URI.open(female_pics[id - 1]), filename: "fpic#{id}.jpg", content_type: "image/jpg")
  user.save

  user_tag = UserTag.new(
    user_id: user.id,
    tag_id: Tag.all.sample.id
  )
  user_tag.save!

end

puts "created user tags"
puts "created #{User.count}female users"
# generate 10 male users

(11..20).each do |id|
  bio_array = [
    "I am a refugee from Syria and I have been living in the camp for four years. I need help with school for my children and a place to stay.",
    "I am a parent, I work in IT, I have experience in gastronomy, I live with my family in the countryside, I love to travel and read books and eat food.",
    "I am a refugee who arrived in Germany in 2022. I have been working since then for restaurants and event industry. I am the parent of four kids and I love cars, nature trips and anything that makes my life more interesting.",
    "I am a refugee from Syria. I have been in Germany for two years now and have been working in the movie industry. I live with my two dogs and would love to meet new people.",
    "I am a parent, refugee from Ukraine. I am passionate about nature, my family and Sunday movies. I am not a stranger to the hardships of life. I am here to give my best and try to find peace in this world.",
    "I am a refugee from Ukraine and have been living in Germany for two years. I am working as an economist and enjoy spending my free time with my pets.",
    "I have a passion for trading and economics, which led me to work in the financial market. I love the outdoors but also enjoy hearing about the lives of others. I am a vegetarian and am very attentive to the needs of animals.",
    "I am a political refugee from the ME. social activist. hope to make this world better. i worked in theater and media and would like to continue this route",
    "I moved here 2 months ago when the war started. I am a parent of 3. we love trips in the woods and playing with our dog. I worked as a cook and had my own restaurant.",
    "Political refugee from Eastern Europe. just arrived here and need accomodation. I am a student of philosophy, about to major. worked in libraries and at university as TA."
  ]
  male_pics = [
    "https://res.cloudinary.com/dbgvo56a1/image/upload/v1661951109/males/87_hnlmur.jpg",
    "https://res.cloudinary.com/dbgvo56a1/image/upload/v1661951109/males/60_km4bsi.jpg",
    "https://res.cloudinary.com/dbgvo56a1/image/upload/v1661951109/males/58_dvinrv.jpg",
    "https://res.cloudinary.com/dbgvo56a1/image/upload/v1661951109/males/58_dvinrv.jpg",
    "https://res.cloudinary.com/dbgvo56a1/image/upload/v1661951109/males/30_qozm8p.jpg",
    "https://res.cloudinary.com/dbgvo56a1/image/upload/v1661951109/males/29_h6rol5.jpg",
    "https://res.cloudinary.com/dbgvo56a1/image/upload/v1661951109/males/26_nrzuqx.jpg",
    "https://res.cloudinary.com/dbgvo56a1/image/upload/v1661951109/males/34_nq8ysj.jpg",
    "https://res.cloudinary.com/dbgvo56a1/image/upload/v1661951109/males/54_przlxu.jpg",
    "https://res.cloudinary.com/dbgvo56a1/image/upload/v1661951109/males/46_fnhty3.jpg"
  ]

  user = User.new(

    # each user is assigned an id from 10-20
    name: Faker::Name.male_first_name,
    email: "test#{id}@giva.com",
    # issue each user the same password
    password: "password",
    password_confirmation: "password",

    # a user can have only one of these roles

    displaced: Faker::Boolean.boolean(true_ratio: 0.5),

    # random bio and problem (if displaced = true) is assigned to user

    # bio: Faker::Lorem.paragraph(sentence_count: 6),
    bio: bio_array[id - 11]
    # tag: Tag.last
  )
  user.photo.attach(io: URI.open(male_pics[id - 11]), filename: "mpic#{id}.jpg", content_type: "image/jpg")
  user.save

  user_tag = UserTag.new(
    user_id: user.id,
    tag_id: Tag.all.sample.id
  )
  user_tag.save!
end

puts "created #{User.count} male users"

User.all.map do |user|
  problem_array = [
    "need accomodation. 3 kids",
    "pls help me with finding a job",
    "need help with Ausländerbehörde",
    "need a place to stay for me and my wife",
    "diabetic. need help with insulin",
    "medical treatment dialisis",
    "help with immigration papers",
    "need a job",
    "accomodation. family of 3",
    "need help with German immigration"
  ]

  solution_array = [
    "I can offer accomodation for 2",
    "good connections with Ausländerbehörde",
    "can help with babysitting",
    "job offer in gastronomy",
    "nurse, can help with medical care",
    "can accompany to immigration office",
    "translator German & Ukrainian",
    "got a lot of free baby stuff",
    "got a couch to crash on",
    "free room for a week",
    "appartment for family of 4"
  ]

  if user.displaced
    # user.problem = Faker::Lorem.paragraph(sentence_count: 2)
    user.problem = problem_array.sample
  else
    user.problem = solution_array.sample
  end
  user.save
end

puts "created displaced people"

# tag seeding

# location seeding

# Bürgeramt
Location.create(
  address: "Potsdamer Str. 61, 10785 Berlin",
  category: "Welcome Center",
  description: "The Welcome Center is the counselling center of the Commissioner of the Berlin Senate for Integration and Migration and a first contact point of the Senate Department for Integration, Labor and Social Affairs for new arrivals, immigrants, people with a migration history and people without a German passport.",
  opening_hour: "09:00",
  closing_hour: "18:00"
)
Location.create(
  address: "Normannenstraße 1-2, 10367 Berlin",
  category: "Bürgeramt",
  description: "The citizens' office (Bürgeramt) handles many aspects of German bureaucracy.",
  opening_hour: "09:00",
  closing_hour: "18:00"
)
Location.create(
  address: "Keplerstraße 2, 10589 Berlin",
  category: "Bürgeramt",
  description: "The citizens' office (Bürgeramt) handles many aspects of German bureaucracy.",
  opening_hour: "09:00",
  closing_hour: "18:00"
)
Location.create(
  address: "Klosterstraße 71, 10179 Berlin",
  category: "Bürgeramt",
  description: "The citizens' office (Bürgeramt) handles many aspects of German bureaucracy.",
  opening_hour: "09:00",
  closing_hour: "18:00"
)
Location.create(
  address: "Mathilde-Jacob-Platz 1, 10551 Berlin",
  category: "Bürgeramt",
  description: "The citizens' office (Bürgeramt) handles many aspects of German bureaucracy.",
  opening_hour: "09:00",
  closing_hour: "18:00"
)

puts "created Bürgeramts"

# pharmacies
Location.create(
  address: "Unter den Linden 69D, 10117 Berlin",
  category: "Pharmacy",
  description: "In Berlin you will get prescription drugs only in licensed pharmacies in order to prevent any drug misuse.",
  opening_hour: "09:00",
  closing_hour: "18:00"
)
Location.create(
  address: "Ecke, Friedrichstraße, Dorotheenstraße 151, 10117 Berlin",
  category: "Pharmacy",
  description: "In Berlin you will get prescription drugs only in licensed pharmacies in order to prevent any drug misuse.",
  opening_hour: "09:00",
  closing_hour: "18:00"
)
Location.create(
  address: "Georgenstraße 25, 10117 Berlin",
  category: "Pharmacy",
  description: "In Berlin you will get prescription drugs only in licensed pharmacies in order to prevent any drug misuse.",
  opening_hour: "09:00",
  closing_hour: "18:00"
)
Location.create(
  address: "Wilhelmstraße 93, 10117 Berlin",
  category: "Pharmacy",
  description: "In Berlin you will get prescription drugs only in licensed pharmacies in order to prevent any drug misuse.",
  opening_hour: "09:00",
  closing_hour: "18:00"
)
puts "created pharmacies"

# donation spots
Location.create(
  address: "Friedrichstraße 19, 10969 Berlin",
  category: "Donation spot",
  description: "Come here to donate!",
  opening_hour: "09:00",
  closing_hour: "18:00"
)
Location.create(
  address: "Bergmannstraße 15, 10961 Berlin",
  category: "Donation spot",
  description: "Come here to donate!",
  opening_hour: "09:00",
  closing_hour: "18:00"
)
Location.create(
  address: "Blücherstraße 11, 10961 Berlin",
  category: "Donation spot",
  description: "Come here to donate!",
  opening_hour: "09:00",
  closing_hour: "18:00"
)
Location.create(
  address: "Wallstraße 15 a, 10179 Berlin",
  category: "Donation spot",
  description: "Come here to donate!",
  opening_hour: "09:00",
  closing_hour: "18:00"
)
Location.create(
  address: "Am Köllnischen Park 1, 10179 Berlin",
  category: "Donation spot",
  description: "Come here to donate!",
  opening_hour: "09:00",
  closing_hour: "18:00"
)
Location.create(
  address: "Reinhardtstraße 18, 10117 Berlin",
  category: "Donation spot",
  description: "Come here to donate!",
  opening_hour: "09:00",
  closing_hour: "18:00"
)
puts "created donation spots"

puts "created locations"

# puts "creating buddies for first and last user"

# Buddy.create(
#   asker: User.first,
#   receiver: User.last
# )

# puts "created buddies for first and last user"

# Select all users from DB
# Split users into two array through PARTITION
# Create a Random number generator by counting an array.
def random_user_gen(array)
  rand = rand(0..array.length - 1)
  array[rand]
end

users = User.all
users_partition = users.partition { |user| user.displaced }
displaced_array = users_partition[0]
non_displaced_array = users_partition[1]

displaced_array.each do |displaced|
  u = random_user_gen(non_displaced_array)
  buddy = Buddy.new(asker: displaced, receiver: u, status: 0)
  buddy.save!
end

puts "created buddies"

# User.all.map do |user|

#   if user.displaced
#     # user.problem = Faker::Lorem.paragraph(sentence_count: 2)
#     user.problem = problem_array.sample
#     user.save
#   else
#     user.problem = nil
#   end
# end
# #   if user.displaced == true
# #     asker: user.all.sample
# #   receiver: user.sample.where(displaced: false)
# # )
# buddy.save

puts "seeding complete"
