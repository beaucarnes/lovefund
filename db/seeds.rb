
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