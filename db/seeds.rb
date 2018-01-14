# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create(
  email: "user1@a.a",
  password: "123123",
  password_confirmation: "123123",
  nickname: "닉유저1",
  name: "user1",
  gender: "male",
  confirmed_at: DateTime.now
)

User.create(
  email: "user2@a.a",
  password: "123123",
  password_confirmation: "123123",
  nickname: "닉유저2",
  name: "user2",
  gender: "female",
  confirmed_at: DateTime.now
)

User.create(
  email: "admin@a.a",
  password: "123123",
  password_confirmation: "123123",
  nickname: "닉관리자",
  name: "admin",
  gender: "male",
  confirmed_at: DateTime.now
).add_role(:admin)

100.times do
  Escape.create(
    title: Faker::Superhero.name,
    contents: Faker::Lorem.paragraphs.join.to_s,
    user_id: 1,
    region: "홍대"
  )
end
