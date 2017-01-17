
Post.create!(title: "Five Chickens",
             name:  "Example User",
             email: "example@example.com",
             phone: "555-555-5555",
             street_address: "1816 Walnut St.",
             description: "I have five chickens to give away. I will not break 
                them up so you have to take all five.",
             zip: "48601",
             category: 3,
             status: 1,
             anon_email: true,
             show_phone: false)
             
Post.create!(title: "Need four chickens",
             name:  "Super User",
             email: "super@example.com",
             phone: "555-555-5555",
             street_address: "1816 Walnut St.",
             description: "I desperately need four chickens. I do not have enough room for anymore than four.",
             zip: "48601",
             category: 1,
             status: 1,
             anon_email: false,
             show_phone: true)
             
80.times do |n|
  Post.create!(title: ( n % 2 == 0 ) ? Faker::ChuckNorris.fact : Faker::Hipster.sentence(3),
             name:  Faker::Name.name,
             email: Faker::Internet.safe_email,
             phone: Faker::PhoneNumber.phone_number,
             street_address: Faker::Address.street_address,
             description: Faker::Lorem.paragraph,
             zip: "48601",
             category: Faker::Number.between(0, 3),
             status: ( n % 7 == 0 ) ? 2 : 1,
             description_met: ( n % 7 == 0 ) ? Faker::StarWars.quote : "",
             anon_email: Faker::Boolean.boolean,
             show_phone: Faker::Boolean.boolean,
             remote_picture_url: "http://lorempixel.com/500/700/")
             
end