10.times do |n|
  name = Faker::Name.name
  email = Faker::Internet.email
  department = rand(1..5)
  password = "password"
  User.create!(name: name,
               department: department,
               email: email,
               password: password,
               password_confirmation: password,
               admin: false
               )
end