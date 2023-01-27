require_relative './source_module'
require_relative '../menu_options/list_source'
require_relative './valid_date'

require 'json'
require 'colorize'
require 'date'

module MovieModule
  include SourceModule

  def list_all_movies
    if @movies.empty?
      puts "\nNo Movies to Show 🚫 Please add some Movies Albums . . .".magenta
    else
      puts "\nAvailable Movies Albums in the list 🎵 🎧 : #{@movies.count} \n".magenta
      @movies.each_with_index do |movie, index|
        print "[ #{index + 1} ]:  Movies: #{movie.movie_name}"
        print "#{movie.source.name} |  Archived: #{movie.archived} | "
        puts "Mute: #{movie.silent} | Publication_date: #{movie.publish_date}"
      end
    end
  end

  def add_movie
    print 'Enter the name of the movie: '
    movie_name = gets.chomp
    print 'Enter the publish date of the movie e.g (2023-01-11): '
    date = set_valid_date

    movie = Movie.new(nil, movie_name, date)

    archive_movie(movie)

    source = add_source
    source.add_item(movie)
    puts "\nSource added for movie #{movie.movie_name} successfully 🤹‍♂️✅ ".green
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

  # rubocop:disable Metrics/MethodLength
  def archive_movie(movie)
    silent = (get_user_input('Want to mute the movie? (y/n): ', %w[y n]) == 'y')
    movie.silent = silent

    current_date = Date.today
    year = current_date.year - movie.publish_date.year

    if year > 10
      archived = (get_user_input('Do you want to archive this movie? (y/n): ', %w[y n]) == 'y')
      movie.archived = archived
      if archived
        if get_user_input('Do you want to confirm archiving this movie (y/n): ', %w[y n]) == 'y'
          movie.move_to_archive
          puts "\nMovie archived and created successfully 🎵 ✅ ".green
        else
          movie.archived = false
          puts "\nMovie not archived but created successfully 🎵 ✅ ".green
        end
      else
        puts "\nMovie album created successfully 🎵 ✅".green
      end
    elsif !silent
      puts "\nThe movie is not silent. It cannot be archved. Album created successfully 🎵 ✅".green
    else
      puts "\nThe movie album is not older than 10 years. It cannot be archived. Album created successfully 🎵 ✅".green
    end
    @movies << movie
  end
  # rubocop:enable Metrics/MethodLength
end
