require_relative './src/modules/game_module'
require_relative './src/modules/book_module'
require_relative './src/modules/genre_module'
require_relative './src/modules/label_module'
require_relative './src/modules/music_module'
require_relative './src/modules/movie_module'
require_relative './src/modules/source_module'
require_relative './src/classes/musicalbum'
require_relative './src/classes/items'
require_relative './src/classes/genre'
require_relative './src/classes/movie'
require_relative './src/classes/source'
require_relative './src/storage'
require 'colorize'
require 'json'

class App
  include BookModule
  include LabelModule
  include GenreModule
  include MusicModule
  include GameModule
  include AuthorModule
  include MovieModule
  include SourceModule

  def initialize
    @games = []
    @albums = []
    @labels = []
    @books = []
    @authors = []
    @genres = []
    @movies = []
    @ = []
    load_data
  end

  def load_data
    @labels = Storage.load_data('labels')
    @books = Storage.load_data('books')
    @genres = Storage.load_data('genres')
    @albums = Storage.load_data('music_albums')
    @authors = Storage.load_data('authors')
    @games = Storage.load_data('games')
    @movies = Storage.load_data('movies')
    @sources = Storage.load_data('sources')
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

  def exit
    puts "Thank you for using the app, see you later!👋  \n\n".blue
    Storage.save_data('books', @books)
    Storage.save_data('labels', @labels)
    Storage.save_data('genres', @genres)
    Storage.save_data('music_albums', @albums)
    Storage.save_data('games', @games)
    Storage.save_data('authors', @authors)
    Storage.save_data('movies', @movies)
    Storage.save_data('sources', @sources)
  end
end
