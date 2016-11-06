User.destroy_all
User.create!(
  name: "Admin",
  email: "admin@gmail.com",
  password: "123456",
  password_confirmation: "123456",
  admin: true,
  state: "Admin state",
  phone: "1234567890")
  
20.times do |n|
  name = "User#{n+1}"
  email = "example-#{n+1}@gmail.com"
  password = "123456"
  User.create!(
    name: name,
    email: email,
    password: password,
    password_confirmation: password,
    state: "Admin state",
    phone: "1234567890")
end
