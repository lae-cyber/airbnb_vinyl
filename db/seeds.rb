# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

require "faker"

2.times do
  User.create!(
    email: Faker::Internet.email,
    password: Faker::Internet.password(min_length: 8)
  )

  Vinyl.create!(
    title: Faker::Music::RockBand.song,
    artist: Faker::Music::RockBand.name,
    genre: 'indie-rock',
    availability: true,
    price: Faker::Number.positive(from: 1.00, to: 5000.00),
    picture_url: "https://images.unsplash.com/photo-1521547418549-6a31aad7c177?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
    user: User.last
  )
end

2.times do
  User.create!(
    email: Faker::Internet.email,
    password: Faker::Internet.password(min_length: 8)
  )

  Vinyl.create!(
    title: Faker::Music::RockBand.song,
    artist: Faker::Music::RockBand.name,
    genre: 'pop',
    availability: true,
    price: Faker::Number.positive(from: 1.00, to: 5000.00),
    picture_url: "https://images.unsplash.com/photo-1548778052-311f4bc2b502?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
    user: User.last
  )
end

2.times do
  User.create!(
    email: Faker::Internet.email,
    password: Faker::Internet.password(min_length: 8)
  )

  Vinyl.create!(
    title: Faker::Music::RockBand.song,
    artist: Faker::Music::RockBand.name,
    genre: 'electro',
    availability: true,
    price: Faker::Number.positive(from: 1.00, to: 5000.00),
    picture_url: "https://images.unsplash.com/photo-1501510691679-728450bdcb40?q=80&w=2069&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
    user: User.last
  )
end

Vinyl.create!(
  user: User.first,
  title: 'Tell Me I’m Pretty',
  artist: 'Cage the Elephant',
  genre: 'indie-rock',
  availability: true,
  price: 0.3,
  picture_url: "https://www.cagetheelephant.com/assets/img/og.jpg"
);
