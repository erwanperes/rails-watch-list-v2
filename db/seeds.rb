require 'httparty'

def fetch_popular_movies
  response = HTTParty.get("https://tmdb.lewagon.com/movie/popular")
  response.parsed_response['results']
end

# Destruction de tous les films existants dans la base de données
Movie.destroy_all

# Récupération des films populaires
movies_data = fetch_popular_movies

# Création des films dans la base de données
movies_data.first(20).each do |movie_data|
  Movie.create(
	title: movie_data['title'],
	overview: movie_data['overview'],
	poster_url: "https://image.tmdb.org/t/p/original#{movie_data['poster_path']}",
	rating: movie_data['vote_average']
  )
end

puts "20 films ont été créés avec succès."