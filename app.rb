require 'colorize'
require_relative './src/classes/game'
require_relative './src/classes/movie'
require_relative './src/menu_options/add_movie'
require_relative './src/menu_options/list_movie'
require_relative './src/menu_options/list_source'
require_relative './src/menu_options/handle_book'
require_relative './src/preserve_data/preserve_movies_data'

require_relative './src/modules/game_module'
require_relative './src/modules/author_module'
require_relative './src/modules/music_module'
require_relative './src/modules/genre_module'
require_relative './src/classes/musicalbum'
require_relative './src/classes/genre'
require_relative './src/storage'

class App
  include AuthorModule
  include GameModule
  include GenreModule
  include MusicModule
  attr_accessor :games, :books, :musics, :movies

  def initialize
    @albums = []
    @genres = []
    @games = []
    @authors = []
    @movies = []
    @sources = []
    @labels = []
    @books = []
  end

  def show_menu
    puts "\nPlease choose an option by entering a number from below 👇: \n\n".yellow.underline
    puts '[ 1 ] - List all books'.cyan
    puts '[ 2 ] - List all music albums'.cyan
    puts '[ 3 ] - List all games'.cyan
    puts "[ 4 ] - List all genres (e.g 'Comedy', 'Thriller')".cyan
    puts "[ 5 ] - List all labels (e.g. 'Gift', 'New')".cyan
    puts "[ 6 ] - List all authors (e.g. 'Stephen King')".cyan
    puts "[ 7 ] - List all sources (e.g. 'From a friend', 'Online shop')".cyan
    puts '[ 8 ] - List all movies'.cyan
    puts '[ 9 ] - Add a book'.cyan
    puts '[ 10 ] - Add a music album'.cyan
    puts '[ 11 ] - Add a game'.cyan
    puts '[ 12 ] - Add a movie'.cyan
    puts "[ 0 ] - Exit \n\n".cyan
    user_choice = gets.chomp.to_i
    select_option(user_choice)
  end

  # def load_data
  #   load_games
  #   load_author
  # end

  def select_option(user_choice)
    case user_choice
    when 1..8
      list_items(user_choice)
    when 9..12
      add_items(user_choice)
    when 0
      exit
    else
      invalid_option
    end
  end

  def invalid_option
    puts "\n 🛑 ❌ ❌ Invalid option. Please select a valid input...".red.underline
    show_menu
  end

  def list_items(user_choice)
    case user_choice
    when 1 # list_all_books
    when 2 then list_all_music_albums
    when 3
      list_all_games
    when 4 then list_all_genres
    when 5 # list_all_labels
      list_labels
    when 6
      list_all_authors
    end
    show_menu
  end

  def add_items(user_choice)
    case user_choice
    when 7 # list_all_sources
    when 8 # list_all_movies
    when 9 # create_book
    when 10 then add_music_album
    when 11
      add_game
    when 12 # add_movie
    end
    show_menu
  end

  def exit
    puts "Thank you for using the app, see you later!👋  \n\n".blue
    Storage.save_data('genres', @genres)
    Storage.save_data('music_albums', @albums)
    Storage.save_data('authors', @authors)
    Storage.save_data('games', @games)
  end
end
