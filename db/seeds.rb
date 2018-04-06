20.times do
  User.create ({
      email: Faker::Internet.email,
      password: Faker::Internet.password
  })
  5.times do
    Book.create ({
        title: Faker::Book.title,
        author: Faker::Book.author,
        description: Faker::Lorem.sentence
    })
  end
end
