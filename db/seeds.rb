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
    photo: open("https://cdn.singulart.com/artworks/pictures/cropped/1973/4299/carousel/serie_4299_252f1c83d553354b81d5a0c96bc5f824.jpeg"),
    location: Faker::Address.full_address,
    latitude: Faker::Address.latitude,
    longitude: Faker::Address.longitude,
  )
  sleep 1
end

posts = Post.all.pluck(:id)

10.times do
  Comment.create!(
    post_id: posts.sample,
    user_id: users.sample,
    comment: Faker::Lorem.paragraph
  )
end
