require_relative './author_module'
require_relative './valid_date'

require 'json'
require 'colorize'
require 'date'

module GameModule
  include AuthorModule

  def list_all_games
    if @games.empty?
      puts "\nNo Games to Show 🚫 Please add some Games . . .".magenta
    else
      puts "\nAvailable Games in the list 🏓 🎮 : #{@games.count} \n".magenta
      @games.each_with_index do |game, index|
        print "[ #{index + 1} ]:  Multiplayer: #{game.multiplayer} | Last Played: #{game.last_played_at} | "
        print "Author: #{game.author.first_name} #{game.author.last_name} | Publication_date: #{game.publish_date}"
      end
    end
  end

  def add_game
    print 'Enter the publish date of the game [YYYY-MM-DD]: '
    publish_date = set_valid_date

    print 'Is it a multiplayer game? [Y/N]: '
    multiplayer = gets.chomp.upcase
    case multiplayer
    when 'Y'
      multiplayer = true
    when 'N'
      multiplayer = false
    end

    puts 'What is the last played date? [YYYY-MM-DD]'
    last_played_at = set_valid_date

    game = Game.new(publish_date, multiplayer, last_played_at)

    archive_game(game)

    author = create_author
    author.add_items(game)
    puts "\nAuthor added for the Game id:#{game.id} successfully 🤹‍♂️✅ ".green
  end

  def get_user_input(prompt, valid_responses)
    while true
      print prompt
      input = gets.chomp
      break if valid_responses.include?(input)

      puts "\n🛑 ❌ Invalid input. Please enter one of the following: #{valid_responses.join(', ')} \n".red
    end
    input
  end

  def archive_game(game)
    current_date = Date.today
    last_played_date = Date.parse(game.last_played_at)
    year = current_date.year - last_played_date.year

    if year > 2
      game.archived = true
      puts "\nGame archived and created successfully 🏓 🎮 ✅ ".green
    else
      puts "\nThe Game is not older than 2 years. It cannot be archived. Game created successfully 🏓 🎮 ✅".green
    end
    @games << game
  end
end
