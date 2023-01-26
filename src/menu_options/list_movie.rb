require_relative '../classes/movie'

@movies = []

def list_movies
  puts 'MOVIES:'
  @movies.each do |movie|
    puts "Silent: #{movie.silent}"
  end
end
