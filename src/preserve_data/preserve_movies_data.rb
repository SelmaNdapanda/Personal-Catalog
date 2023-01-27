require 'json'
require_relative '../classes/movie'
require_relative '../classes/source'
require_relative '../../app'

def load_movies
  return unless File.exist?('./src/preserve_data/movies.json')

  file = File.open('./src/preserve_data/movies.json')

  if file.empty?
    'Sorry, there are no movies yet!'
  else
    movies = JSON.parse(File.read('./src/preserve_data/movies.json'))

    movies.each do |movie|
      movie = Movie.new(movie['silent'])
      @movies << movie
    end
  end
  file.close
end

def load_sources
  return unless File.exist?('./src/preserve_data/sources.json')

  file = File.open('./src/preserve_data/sources.json')

  if file.empty?
    'Sorry, there are sources yet!'
  else
    sources = JSON.parse(File.read('./src/preserve_data/sources.json'))

    sources.each do |source|
      source = Author.new(source['name'])
      @sources << source
    end
  end
  file.close
end

def save_movie(publish_date, silent, name)
  obj = {
    publish_date: publish_date,
    silent: silent,
    name: name
  }

  return unless File.exist?('./src/preserve_data/movies.json')

  file = File.open('./src/preserve_data/movies.json')

  if file.empty?
    game = [obj]
  else
    movie = JSON.parse(File.read('./src/preserve_data/movies.json'))
    movie << obj
  end

  file.close

  myfile = File.open('./src/preserve_data/movies.json', 'w')
  myfile.write(JSON.pretty_generate(movie))
  myfile.close
end

def save_source(name)
  obj = {
    name: name,
  }

  return unless File.exist?('./src/preserve_data/sources.json')

  file = File.open('./src/preserve_data/sources.json')

  if file.empty?
    source = [obj]
  else
    source = JSON.parse(File.read('./src/preserve_data/sources.json'))
    source << obj
  end

  file.close

  myfile = File.open('./src/preserve_data/sources.json', 'w')
  myfile.write(JSON.pretty_generate(source))
  myfile.close
end
