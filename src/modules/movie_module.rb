require_relative './source_module'
require_relative '../menu_options/list_source'
require_relative './valid_date'

require 'json'
require 'colorize'
require 'date'

module MovieModule
  include SourceModule

  def list_all_movies
    if @albums.empty?
      puts "\nNo Movies to Show 🚫 Please add some Movies Albums . . .".magenta
    else
      puts "\nAvailable Movies Albums in the list 🎵 🎧 : #{@albums.count} \n".magenta
      @albums.each_with_index do |album, index|
        print "[ #{index + 1} ]:  Movies: #{album.movie_name}"
        print "#{album.source.name} |  Archived: #{album.archived} | "
        puts "Mute: #{album.silent} | Publication_date: #{album.publish_date}"
      end
    end
  end

  def add_movie
    print 'Enter the name of the movie: '
    movie_name = gets.chomp
    print 'Enter the publish date of the movie e.g (2023-01-11): '
    date = set_valid_date

    album = Movie.new(nil, movie_name, date)

    archive_movie(album)

    source = add_source
    source.add_item(album)
    puts "\nSource added for movie #{album.movie_name} successfully 🤹‍♂️✅ ".green
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

  # rubocop:disable Metrics/PerceivedComplexity
  # rubocop:disable Metrics/MethodLength
  def archive_movie(album)
    silent = (get_user_input('Want to mute the movie? (y/n): ', %w[y n]) == 'y')
    album.silent = silent

    current_date = Date.today
    year = current_date.year - album.publish_date.year

    if year > 10 && silent
      archived = (get_user_input('Do you want to archive this movie? (y/n): ', %w[y n]) == 'y')
      album.archived = archived
      if archived
        if get_user_input('Do you want to confirm archiving this movie (y/n): ', %w[y n]) == 'y'
          album.move_to_archive
          puts "\nMovie archived and created successfully 🎵 ✅ ".green
        else
          album.archived = false
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
    @albums << album
  end
  # rubocop:enable Metrics/MethodLength
  # rubocop:enable Metrics/PerceivedComplexity
end
