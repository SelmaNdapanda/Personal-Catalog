require_relative '../classes/movie'
require_relative '../classes/source'
require_relative '../preserve_data/preserve_movies_data'

@movies = []
@sources = []

def add_movie
  # get movie name
  puts 'Movie name:'
  name = gets.chomp
  puts 'Provide published date'
  publish_date = gets.chomp

  puts 'Wish to play sound? [Y/N]'
  silent = gets.chomp.upcase
  case silent
  when 'Y'
    silent = true
  when 'N'
    silent = false
  end

  # create movie
  movie = Movie.new(publish_date, silent)
  @movies.push(movie)
  save_game(silent)
  puts 'MOVIE CREATED'

  # create source
  source = Source.new(id, name)
  @sources.push(source)
  save_game(id, name)
  puts 'SOURCE CREATED'
end
