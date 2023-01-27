require_relative '../classes/source'
require 'colorize'
require 'date'

module SourceModule
  def list_all_sources
    if @sources.empty?
      puts "\nNo Sources to Show 🚫 Add some sources . . . ".magenta
    else
      puts "\nAvailable Sources in the list 🔸🔷 : #{@sources.count} \n".magenta
      @sources.each_with_index do |source, index|
        print "[ #{index + 1} ]: Name: #{source.name} \n"
      end
    end
  end

  def create_source
    print 'Enter the name of the source: '
    name = gets.chomp
    source = Source.new(name)
    @sources << source
    source
  end

  def select_source
    list_all_sources
    input = nil
    while input.nil?
      print "\nPlease select a source by typing the corresponding number or "
      print "type 'back' to return to the previous menu: "
      input = gets.chomp
      if !valid_input?(input)
        print "\n🛑 ❌ Invalid input. Please try again \n".red
        input = nil
      elsif input == 'back'
        add_source
      end
    end
    @sources[input.to_i - 1]
  end

  def valid_input?(input)
    return true if input == 'back'

    (1..@sources.length).include?(input.to_i)
  end

  def add_source
    puts "\nSelect a source for this item or create a new one: "
    puts '[ 1 ] Select from existing sources'
    puts '[ 2 ] Add a new source'

    input = gets.chomp.to_i
    until [1, 2].include?(input)
      print "\n🛑 ❌ Invalid input, please enter 1 or 2 \n".red
      input = gets.chomp.to_i
    end

    case input
    when 1
      select_source
    when 2
      create_source
    end
  end
end
