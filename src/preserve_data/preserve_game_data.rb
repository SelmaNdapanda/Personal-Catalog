require 'json'
require_relative '../classes/game'
require_relative '../classes/author'
require_relative '../../app'

def load_games
  return unless File.exist?('./src/preserve_data/games.json')

  file = File.open('./src/preserve_data/games.json')

  if file.empty?
    'Sorry, There is no Game saved yet!'
  else
    games = JSON.parse(File.read('./src/preserve_data/games.json'))

    games.each do |game|
      game = Game.new(game['publish_date'], game['multiplayer'], game['last_played_at'])
      @games << game
    end
  end
  file.close
end

def load_author
  return unless File.exist?('./src/preserve_data/authors.json')

  file = File.open('./src/preserve_data/authors.json')

  if file.empty?
    'Sorry, There is no Author saved yet!'
  else
    authors = JSON.parse(File.read('./src/preserve_data/authors.json'))

    authors.each do |author|
      author = Author.new(author['first_name'], author['last_name'])
      @authors << author
    end
  end
  file.close
end

def save_game(publish_date, multiplayer, last_played_at)
  obj = {
    publish_date: publish_date,
    multiplayer: multiplayer,
    last_played_at: last_played_at
  }

  return unless File.exist?('./src/preserve_data/games.json')

  file = File.open('./src/preserve_data/games.json')

  if file.empty?
    game = [obj]
  else
    game = JSON.parse(File.read('./src/preserve_data/games.json'))
    game << obj
  end

  file.close

  myfile = File.open('./src/preserve_data/games.json', 'w')
  myfile.write(JSON.pretty_generate(game))
  myfile.close
end

def save_author(first_name, last_name)
  obj = {
    first_name: first_name,
    last_name: last_name
  }

  return unless File.exist?('./src/preserve_data/authors.json')

  file = File.open('./src/preserve_data/authors.json')

  if file.empty?
    author = [obj]
  else
    author = JSON.parse(File.read('./src/preserve_data/authors.json'))
    author << obj
  end

  file.close

  myfile = File.open('./src/preserve_data/authors.json', 'w')
  myfile.write(JSON.pretty_generate(author))
  myfile.close
end
