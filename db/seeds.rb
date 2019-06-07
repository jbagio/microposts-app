User.create!(name: 'Example User',
             email: 'example@railstutorial.org',
             password: 'foobar',
             password_confirmation: 'foobar',
             admin: true)

99.times do |n|
  name  = Faker::Name.name
  email = "example-#{ n+1 }@railstutorial.org"
  phone_number = Faker::PhoneNumber.subscriber_number
  password = 'password'
  User.create!(name: name,
               email: email,
               phone_number: phone_number,
               password: password,
               password_confirmation: password)
end
