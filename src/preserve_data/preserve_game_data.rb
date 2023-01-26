require 'json'
require_relative '../classes/game'
require_relative '../classes/author'
require_relative '../../app'

def load_games
  if File.exist?('./src/preserve_data/games.json')
    file = File.open('./src/preserve_data/games.json')

    if file.size.zero?
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
end

def load_author
  if File.exist?('./src/preserve_data/authors.json')
    file = File.open('./src/preserve_data/authors.json')

    if file.size.zero?
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
end

def save_game(publish_date, multiplayer, last_played_at)
  obj = {
    publish_date: publish_date,
    multiplayer: multiplayer,
    last_played_at: last_played_at
  }

  if File.exist?('./src/preserve_data/games.json')
    file = File.open('./src/preserve_data/games.json')

    if file.size.zero?
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
end

def save_author(first_name, last_name)
  obj = {
    first_name: first_name,
    last_name: last_name
  }

  if File.exist?('./src/preserve_data/authors.json')
    file = File.open('./src/preserve_data/authors.json')

    if file.size.zero?
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
end
