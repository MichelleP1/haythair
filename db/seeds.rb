Furniture.destroy_all
Category.destroy_all

NUMBER_OF_CATEGORIES = 4
FURNITURE_PER_CATEGORY = 25

NUMBER_OF_CATEGORIES.times do
  category = Category.create(title: Faker::House.unique.room)

  FURNITURE_PER_CATEGORY.times do
    furniture = category.furniture.create(
      title:            Faker::Hipster.words(supplemental: true)[0] + " " + Faker::House.furniture,
      price:            Faker::Number.decimal(l_digits: 2),
      description:      Faker::Hipster.paragraph(sentence_count: 3),
      weight: rand(3..200),
      stock: rand(0..100)
    )

    #--> unsplash API ... comes back with a 600x600 image based on the horse name and breed!
    query = URI.encode_www_form_component([furniture.title, category.title].join(","))

    downloaded_image = URI.open("https://source.unsplash.com/600x600/?#{query}")

    furniture.image.attach(io:       downloaded_image,
                       filename: "m-#{[furniture.title, category.title].join('-')}.jpg")

    sleep(0.5) # <=== if youre downloading A LOT of images, do yourself a favour and DONT get yourself blocked by spamming the API.
  end
end

puts "Created #{Category.count} Categories."
puts "Created #{Furniture.count} Furniture."

# AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?
