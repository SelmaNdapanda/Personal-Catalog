require_relative '../classes/author'
require 'colorize'
require 'date'

module AuthorModule
  def list_all_authors
    if @authors.empty?
      puts "\nNo Authors to Show 🚫 Add some authors . . . ".magenta
    else
      puts "\nAvailable authors in the list 🔸🔷 : #{@authors.count} \n".magenta
      @authors.each_with_index do |author, index|
        print "[ #{index + 1} ]: ID: #{author.id}, First Name: #{author.first_name}, Last Name: #{author.last_name} \n"
      end
    end
  end

  def create_author
    print 'Enter the First name of the game author:'
    first_name = gets.chomp

    print 'Enter the Last name of the game author:'
    last_name = gets.chomp
    author = Author.new(first_name, last_name)
    @authors << author
    author
  end
end
