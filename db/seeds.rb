# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


users = []

10.times do
  user = User.new(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    email: Faker::Internet.email(),
    password: "xxxxxx",
    city: "Lisbon"
    )
  users << user
  user.save!
end


movies = []

20.times do
  movie = Movie.new(
    title: Faker::Movie.name,
    )
  movies << movie
  movie.save!
end


theaters = []

names = ["Sao Jorge", "Monumental", "Cinemateca", "Cinema Ideal"]
adresses =["Av. da Liberdade 175","Av. Praia da Vitória, 72","R. Barata Salgueiro 39","Rua do Loreto 15"]
cities = ["Lisbon","Lisbon","Lisbon","Lisbon"]

(0...4).each do |i|

  theater = Theater.new(
    name: names[i],
    adress: adresses[i],
    city: cities[i]
    )
  theaters << theater
  theater.save!
  end

genres = ["Classic French", "Bollywood horror", "Hopping Vampire films"]

shows = []

10.times do
  show = Show.new(
    date: Faker::Date.forward(20),
    time: Faker::Time.between(DateTime.now , DateTime.now + 20),
    movie: Movie.all.sample,
    theater: Theater.all.sample
    )
  shows << show
  show.save!
end
