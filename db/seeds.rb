# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

User.create!(name: "hilary",
            email: "hill@dic.com",
            password: "123123",
            password_confirmation: "123123",
            admin: true)


10.times do |n|
  name = Faker::Name.name
  email = Faker::Internet.email
  password = "password"
  User.create!(name: name,
            email: email,
            password_digest: password,
            )
end

10.times do |n|
    name = Faker::Name.name
    Label.create!(name: name,
                 )
end

10.times do |n|
    title = Faker::Title.title
    details = Faker::Details.detail
    time = Faker::Time.time
    status = Faker::Status.status
    expired_at = Faker::Expired_at.expired_at
    priority = Faker::Priority.priority
    user_id = Faker::User_id.user.id
    Task.create!(title: title,
              detail: detail,
              time: time,
              expired_at: expired_at,
              priority: priority,
              user_id: user.id
              )
end