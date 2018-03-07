movies = [{title:"The Seven Samurai",director:"Akira Kurosawa", remote_poster_url: "https://images-na.ssl-images-amazon.com/images/I/91OOTyd4ToL._SL1500_.jpg" },\
  {title: "Bonnie and Clyde", director: "Arthur Penn", remote_poster_url: "https://fffmoviepostermuseum.com/wp-content/uploads/2016/05/bonnie-clyde-french-movie-poster.jpg" },\
  {title: "Reservoir Dogs", director: "Quentin Tarantino", remote_poster_url: "https://sites.psu.edu/filmsforall/files/2016/11/poster-370-1dzsy8z.jpg" },\
  {title: "Airplane!", director: "Jim Abrahams", remote_poster_url: "https://images-na.ssl-images-amazon.com/images/I/51zWRLrTz3L._SY450_.jpg" },\
  {title: "Pan's Labyrinth", director: "Guillermo del Toro", remote_poster_url: "https://www.dvdsreleasedates.com/posters/800/P/Pans-Labyrinth-movie-poster.jpg" },\
  {title: "Doctor Zhivago", director: "David Lean", remote_poster_url: "https://i.pinimg.com/originals/5a/bd/f9/5abdf9b6b0f2c68a0598de290f91d2d0.jpg" },\
  {title: "The Deer Hunter", director: "Michael Cimino", remote_poster_url: "https://raginggoodfellas.files.wordpress.com/2013/11/large_the_deer_hunter.jpg" },\
  {title: "Close Encounters of the Third Kind", director: "Steven Spielberg", remote_poster_url: "https://i.pinimg.com/736x/b5/d2/02/b5d2025feca0a81a23b5094017f6fd99--epic-movie-movie-posters.jpg" },\
  {title: "Up", director: "Pete Docter", remote_poster_url: "https://vignette.wikia.nocookie.net/transcripts/images/9/97/Disney_and_Pixar%27s_Up_-_iTunes_Movie_Poster.jpg/revision/latest?cb=20170206002656" },\
  {title: "Rocky", director: "John G. Avildsen", remote_poster_url: "https://www.posterduniya.com/wp-content/uploads/2016/10/Rocky.jpg" },\
  {title: "Memento", director: "Christopher Nolan", remote_poster_url: "https://i0.wp.com/www.movie-poster-artwork-finder.com/posters/memento-poster-artwork-guy-pearce-carrie-anne-moss-joe-pantoliano.jpg" },\
  {title: "Braveheart", director: "Mel Gibson", remote_poster_url: "https://ae01.alicdn.com/kf/HTB1fmsjHVXXXXX2XXXXq6xXFXXXM/Free-shipping22-X35-inch-Braveheart-Movie-Poster-Custom-ART-PRINT.jpg" },\
  {title: "Slumdog Millionaire", director: "Danny Boyle", remote_poster_url: "http://www.freemovieposters.net/posters/slumdog_millionaire_2008_342_poster.jpg" },\
  {title: "The Lord of the Rings", director: "Peter Jackson", remote_poster_url: "https://www.allaboutmovies.com.au/media/k2/items/cache/6ecf1cbf700e3690cd5560547677892b_XL.jpg" },\
  {title: "Beauty and the Beast", director: "Gary Trousdale", remote_poster_url: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSoWbaoDWWwma1KVQWncLxJlQiHMQ_ACbifIhWxVjErxgJ8gHQK" },\
  {title: "Seven", director: "David Fincher", remote_poster_url: "https://i.pinimg.com/736x/53/9e/47/539e475b4f7621e4da516e3425c60c90--seen--graphic-posters.jpg" },\
  {title: "Inception", director: "Christopher Nolan", remote_poster_url: "https://ae01.alicdn.com/kf/HTB1OlDhl8DH8KJjy1zeq6xjepXa4/Inception-Movie-Art-Poster-Canvas-Print-Wall-Art-Picture-for-Home-Decor.jpg" },\
  {title: "Die Hard", director: "John McTiernan", remote_poster_url: "https://vignette.wikia.nocookie.net/diehard/images/c/c3/DieHard.jpg/revision/latest?cb=20110515165526" },\
  {title: "Amadeus", director: "Milos Forman", remote_poster_url: "https://c1.staticflickr.com/9/8014/7271129204_e5e84c2240_b.jpg" },\
  {title: "Wall-E", director:"Andrew Stanton", remote_poster_url: "http://live-timely-kxd9sfz2in.time.ly/wp-content/uploads/2017/06/walle-5543a08739869.jpg"}
]

movies.each do |mov|
  Movie.create(title: mov[:title], director: mov[:director], remote_poster_url: mov[:remote_poster_url] )
end

10.times do
  favmovies_ind = (0...movies.size).to_a.sample((1..5).to_a.sample)
  favdir_ind = (0...movies.size).to_a.sample((1..5).to_a.sample)

  user = User.new(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    email: Faker::Internet.email(),
    password: "xxxxxx",
    city: "Lisbon"
  )
  user.favmovies = favmovies_ind.map{ |i| Favmovie.new(title: movies[i][:title]) }
  user.favdirectors = favdir_ind.map{ |i| Favdirector.new(name: movies[i][:director]) }
  user.save
end


names = ["Sao Jorge", "Monumental", "Cinemateca", "Cinema Ideal"]
locations =["Av. da Liberdade 175, Lisbon","Av. Praia da Vitória, 72, Lisbon","R. Barata Salgueiro 39, Lisbon","Rua do Loreto 15, Lisbon"]

(0...4).each do |i|
  Theater.create(name: names[i], location: locations[i])
end

genres = ["Classic French", "Bollywood horror", "Hopping Vampire films"]

10.times do
  Show.create(
    date: Faker::Date.forward((0..20).to_a.sample),
    time: Faker::Time.between(Date.today, Date.today, :evening) ,
    movie: Movie.all.sample,
    theater: Theater.all.sample
    )
end

5.times do
  first_date = Faker::Date.forward((0..20).to_a.sample)
  first_time = Faker::Time.between(Date.today, Date.today, :evening)
  Posting.create(
    first_date: first_date,
    last_date: first_date + (0..3).to_a.sample,
    first_time: first_time,
    last_time: first_time + (0..5).to_a.sample,
    user: User.all.sample,
    movie: Movie.all.sample,
    theater: Theater.all.sample,
    )
end


5.times do
  Pairing.create(
    user: User.all.sample,
    show: Show.all.sample,
    posting: Posting.all.sample,
    )
end



