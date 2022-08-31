# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require "open-uri"

require "faker"

User.delete_all

# generate 10 female users
(1..10).each do |id|
  bio_array = ["I am a refugee from Syria and I have been living in the camp for four years. I need help with school for my children and a place to stay.",
              "I am a parent, I work in IT, I have experience in gastronomy, I live with my family in the countryside, I love to travel and read books and eat food.",
              "I am a refugee who arrived in Germany in 2022. I have been working since then for restaurants and event industry. I am the parent of four kids and I love cars, nature trips and anything that makes my life more interesting.",
              "I am a refugee from Syria. I have been in Germany for two years now and have been working in the movie industry. I live with my two dogs and would love to meet new people.",
              "I am a parent, refugee from Ukraine. I am passionate about nature, my family and Sunday movies. I am not a stranger to the hardships of life. I am here to give my best and try to find peace in this world.",
              "I am a refugee from Ukraine and have been living in Germany for two years. I am working as an economist and enjoy spending my free time with my pets.",
              "I have a passion for trading and economics, which led me to work in the financial market. I love the outdoors but also enjoy hearing about the lives of others. I am a vegetarian and am very attentive to the needs of animals.",
              "I am a political refugee from the ME. social activist. hope to make this world better. i worked in theater and media and would like to continue this route",
              "I moved here 2 months ago when the war started. I am a parent of 3. we love trips in the woods and playing with our dog. I worked as a cook and had my own restaurant.",
              "Political refugee from Eastern Europe. just arrived here and need accomodation. I am a student of philosophy, about to major. worked in libraries and at university as TA."]


  User.create!(

    # each user is assigned an id from 1-20

      id: id,

      name: Faker::Name.female_first_name,
      email: "test#{id}@giva.com",


      # issue each user the same password

      password: "password",
      password_confirmation: "password",

      # a user can have only one of these roles

      displaced: Faker::Boolean.boolean(true_ratio: 0.5),

      # random bio and problem (if displaced = true) is assigned to user

      # bio: Faker::Lorem.paragraph(sentence_count: 6),
      bio: bio_array.sample
)
end

# generate 10 male users

(11..20).each do |id|
  bio_array = ["I am a refugee from Syria and I have been living in the camp for four years. I need help with school for my children and a place to stay.",
              "I am a parent, I work in IT, I have experience in gastronomy, I live with my family in the countryside, I love to travel and read books and eat food.",
              "I am a refugee who arrived in Germany in 2022. I have been working since then for restaurants and event industry. I am the parent of four kids and I love cars, nature trips and anything that makes my life more interesting.",
              "I am a refugee from Syria. I have been in Germany for two years now and have been working in the movie industry. I live with my two dogs and would love to meet new people.",
              "I am a parent, refugee from Ukraine. I am passionate about nature, my family and Sunday movies. I am not a stranger to the hardships of life. I am here to give my best and try to find peace in this world.",
              "I am a refugee from Ukraine and have been living in Germany for two years. I am working as an economist and enjoy spending my free time with my pets.",
              "I have a passion for trading and economics, which led me to work in the financial market. I love the outdoors but also enjoy hearing about the lives of others. I am a vegetarian and am very attentive to the needs of animals.",
              "I am a political refugee from the ME. social activist. hope to make this world better. i worked in theater and media and would like to continue this route",
              "I moved here 2 months ago when the war started. I am a parent of 3. we love trips in the woods and playing with our dog. I worked as a cook and had my own restaurant.",
              "Political refugee from Eastern Europe. just arrived here and need accomodation. I am a student of philosophy, about to major. worked in libraries and at university as TA."]


  User.create!(

    # each user is assigned an id from 10-20

      id: id,

      name: Faker::Name.male_first_name,
      email: "test#{id}@giva.com",


      # issue each user the same password

      password: "password",
      password_confirmation: "password",

      # a user can have only one of these roles

      displaced: Faker::Boolean.boolean(true_ratio: 0.5),

      # random bio and problem (if displaced = true) is assigned to user

      # bio: Faker::Lorem.paragraph(sentence_count: 6),
      bio: bio_array.sample
)
end

User.all.map do |user|

  problem_array = ["need accomodation. 3 kids",
    "pls help me with finding a job",
    "need help with Ausländerbehörde",
    "need a place to stay for me and my wife",
    "diabetic. need help with insulin",
    "medical treatment dialisis",
    "help with immigration papers",
    "need a job",
    "accomodation. family of 3",
    "need help with german immigration"]

  if user.displaced
    # user.problem = Faker::Lorem.paragraph(sentence_count: 2)
    user.problem = problem_array.sample
    user.save
  else
    user.problem = nil
  end
end

# User.create!(
#   email: "nhumo@test.com",
#   password: "123456789"
# )

# User.create!(
#   email: "max@test.com",
#   password: "123456789"
# )

# User.create!(
#   email: "denis@test.com",
#   password: "123456789"
# )

# User.create!(
#   email: "ej@test.com",
#   password: "123456789"
# )
