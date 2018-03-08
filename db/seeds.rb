<<<<<<< HEAD
def round_to_5_minutes(t)
  rounded = Time.at((t.to_time.to_i / 300.0).round * 300)
  t.is_a?(DateTime) ? rounded.to_datetime : rounded
end
=======
>>>>>>> master


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

genres = ["French Nouvelle Vague", "Italian neorealism", "Soviet Avantgarde", "B-movies", "Horror classics"]

100.times do
  favmovies_ind = (0...movies.size).to_a.sample((1..5).to_a.sample)
  favdir_ind = (0...movies.size).to_a.sample((1..5).to_a.sample)
  favgenre_ind = (0...genres.size).to_a.sample((1..3).to_a.sample)

  gender = %w(m f).sample
  first_name = gender == 'f' ? FactoryHelper::Name.female_first_name : FactoryHelper::Name.male_first_name
  remote_photo_url = gender == 'f' ? UiFaces.woman : UiFaces.man
  user = User.new(
    first_name: first_name,
    last_name: FactoryHelper::Name.last_name,
    email: "#{first_name}@#{FactoryHelper::Internet.domain_name}",
    password: "xxxxxx",
    city: "Lisbon",
    remote_photo_url: remote_photo_url
  )
  user.favmovies = favmovies_ind.map{ |i| Favmovie.new(title: movies[i][:title]) }
  user.favdirectors = favdir_ind.map{ |i| Favdirector.new(name: movies[i][:director]) }
  user.genres = favgenre_ind.map{ |i| Genre.new(name: genres[i]) }
  user.save
end


names = ["Sao Jorge", "Monumental", "Cinemateca", "Cinema Ideal"]
locations =["Av. da Liberdade 175, Lisbon","Av. Praia da Vitória, 72, Lisbon","R. Barata Salgueiro 39, Lisbon","Rua do Loreto 15, Lisbon"]

(0...4).each do |i|
  Theater.create(name: names[i], location: locations[i])
end

Movie.all.each do |movie|
  30.times do
    Show.create(
      date: FactoryHelper::Date.forward(30), # random dates in the next months
      time: round_to_5_minutes(FactoryHelper::Time.between(Date.today, Date.today, :evening)) ,
      movie: movie,
      theater: Theater.all.sample
      )
  end
end

150.times do
  Posting.create(user: User.all.sample,show: Show.all.sample)
end

5.times do
  Pairing.create!(
    user: User.all.sample,
    show: Show.all.sample,
    posting: Posting.all.sample
    )
end
