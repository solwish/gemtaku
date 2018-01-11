# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create(
  email: "test@a.a",
  password: "123123",
  password_confirmation: "123123",
  nickname: "사막여우",
  name: "강동원",
  phone: "010-1234-2143"
)
User.create(
  email: "adf@adf.com",
  password: "123123",
  password_confirmation: "123123",
  nickname: "adf",
  name: "adf",
  phone: "010-1234-2000"
)

10.times do
  Escape.create(
    title: Faker::Superhero.name,
    contents: Faker::Lorem.paragraphs.join.to_s,
    user_id: 1,
    region: "홍대"
  )
end
