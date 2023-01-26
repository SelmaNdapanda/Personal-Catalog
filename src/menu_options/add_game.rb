require_relative '../classes/game'
require_relative '../classes/author'
require_relative '../preserve_data/preserve_game_data'

@games = []
@authors = []

# rubocop:disable Metrics/MethodLength
def add_game
  # get the values for author
  puts 'First name of the game author:'
  first_name = gets.chomp

  puts 'Last name of the game author:'
  last_name = gets.chomp

  # get the values for game
  puts 'Publish date of the game [YYYY-MM-DD]:'
  publish_date = DateTime.parse(gets.chomp).to_date

  puts 'Is it a multiplayer game? [Y/N]'
  multiplayer = gets.chomp.upcase
  case multiplayer
  when 'Y'
    multiplayer = true
  when 'N'
    multiplayer = false
  end

  puts 'What is the last played date? [YYYY-MM-DD]'
  last_played_at = DateTime.parse(gets.chomp).to_date

  # create the game
  game = Game.new(publish_date, multiplayer, last_played_at)
  @games.push(game)
  save_game(publish_date, multiplayer, last_played_at)

  # create the author
  author = Author.new(first_name, last_name)
  @authors.push(author)
  save_author(first_name, last_name)
  
  puts 'GAME AND AUTHOR CREATED'
end
# rubocop:enable Metrics/MethodLength
