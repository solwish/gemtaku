# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create(
  email: "adf@adf.com",
  password: "123123",
  password_confirmation: "123123",
  nickname: "user1eda",
  name: "user",
  phone: "010-1234-2143"
)

User.create(
  email: "admin@admin.com",
  password: "123123",
  password_confirmation: "123123",
  nickname: "관리자",
  name: "admin",
  phone: "010-1234-2143",
  is_admin?: true
)

100.times do
  Escape.create(
    title: Faker::Superhero.name,
    contents: Faker::Lorem.paragraphs.join.to_s,
    user_id: 1,
    region: "홍대"
  )
end
