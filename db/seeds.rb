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

6.times do
  User.create!(
    email: Faker::Internet.email,
    password: Faker::Internet.password(min_length: 8)
  )

  Vinyl.create!(
    title: Faker::Music::RockBand.song,
    artist: Faker::Music::RockBand.name,
    availability: true,
    price: Faker::Number.positive(from: 1.00, to: 5000.00),
    picture_url: Faker::LoremFlickr.image(size: "50x60", search_terms: ['music']),
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
  picture_url:'https://www.xsnoize.com/wp-content/webp-express/webp-images/uploads/2015/12/FINALL-TELL-ME-IM-PRETTY-CTE_TMIPretty_CVR_F2.jpg.png.webp'
);
