# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

AdminUser.destroy_all
AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?


Comment.destroy_all
Post.destroy_all
User.destroy_all


5.times do |i|
  User.create!(
    name: Faker::BreakingBad.character,
    email: "usuario#{i}@gmail.com",
    password: "123456"
  )
end
users = User.all.pluck(:id)

5.times do |i|
  Post.create!(
    user_id: users.sample,
    name: Faker::Beer.name,
    photo: "http://placekitten.com/200/300",
    location: Faker::Address.full_address
  )
  sleep 1
end
