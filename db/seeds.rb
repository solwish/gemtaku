# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Club.create(name: "커뮤니티 1")
Club.create(name: "커뮤니티 2")

User.create(
  email: "user1@a.a",
  password: "123123",
  password_confirmation: "123123",
  nickname: "닉유저1",
  name: "user1",
  gender: "male",
  club_id: 1,
  confirmed_at: DateTime.now
)

User.create(
  email: "user2@a.a",
  password: "123123",
  password_confirmation: "123123",
  nickname: "닉유저2",
  name: "user2",
  gender: "female",
  club_id: 1,
  confirmed_at: DateTime.now
)

User.create(
  email: "user3@a.a",
  password: "123123",
  password_confirmation: "123123",
  nickname: "닉유저3",
  name: "user3",
  gender: "female",
  club_id: 2,
  confirmed_at: DateTime.now
)

User.create(
  email: "admin@a.a",
  password: "123123",
  password_confirmation: "123123",
  nickname: "닉관리자",
  name: "admin",
  gender: "male",
  club_id: 2,
  confirmed_at: DateTime.now
).add_role(:admin)

50.times do
  Shop.create(
    title: Faker::Superhero.name,
    content: Faker::Lorem.paragraphs.join.to_s,
    address: Faker::Lorem.paragraphs.join.to_s,
    region: ["홍대", "신촌", "강남", "건대"].sample
  )
end

100.times do
  Escape.create(
    title: Faker::Superhero.name,
    content: Faker::Lorem.paragraphs.join.to_s,
    user_id: 1 + rand(2),
    region: "홍대"
  )
end

1000.times do
  Comment.create(
    content: Faker::Superhero.name,
    user_id: 1 + rand(3),
    escape_id: 1 + rand(100)
  )
end

AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?
