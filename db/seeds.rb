# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

users = []

100.times do
  first_name =  Faker::Name.first_name
  user = User.new(
    first_name: first_name,
    last_name: Faker::Name.last_name,
    email: Faker::Internet.email(),
    password: "xxxxxx"
  )
  users << user
  user.save!
end

Movie.create(title: "Fahrenheit 451", director: "François Truffaut", poster: "https://www.cinematerial.com/movies/fahrenheit-451-i60390/p/4khj0jhn")
Movie.create(title: "Psycho", director: "Alfred Hitchcock", poster: "https://www.cinematerial.com/movies/psycho-i54215/p/0gxhwkwp")



