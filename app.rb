class App
  attr_accessor :genre, :author, :source, :label, :publish_date, :archived

  def initialize
    @genre = genre
    @author = author
    @source = source
    @label = label
    @publish_date = publish_date
    @archived = archived
  end

  def list_genre
    if @genre.emty?
      puts 'No genre available'
    else
      genre.each do |item|
        puts "Genre: #{item.name}"
      end
    end
  end

  def list_author
    if @author.emty?
      puts 'No author available'
    else
      author.each do |item|
        puts "First Name: #{item.first_ame}, Last_name: #{item.last_name}"
      end
    end
  end

  def list_label
    if @label.emty?
      puts 'No label available'
    else
      label.each do |item|
        puts "Title: #{item.title}, Colour: #{item.colour}"
      end
    end
  end

  def list_source
    if @source.emty?
      puts 'No source available'
    else
      source.each do |item|
        puts "Name: #{item.name}"
      end
    end
  end
end
