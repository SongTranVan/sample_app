User.create!(name: "Song Tran Van",
             email: "songtranvan2511@gmail.com",
             password: "123321",
             password_confirmation: "123321",
             admin: true)

40.times do |n|
  name  = Faker::Name.name
  email = "user#{n+1}@gmail.com"
  password = "123321"
  User.create!(name: name,
               email: email,
               password: password,
               password_confirmation: password)
end
