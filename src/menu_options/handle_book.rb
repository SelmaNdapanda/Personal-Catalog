require_relative '..\classes\book'

@books = []
@labels = []

def list_books
  @books&.each do |book|
    puts "Publisher: #{book.publisher}, Cover state: #{book.cover_state}, Published date: #{book.publish_date}"
  end
end

def list_labels
  @labels&.each do |label|
    puts "Title: #{label.title}, Color: #{label.color}"
  end
end

def add_book
  puts 'Please enter the title of the label of the book :'
  title = gets.chomp
  puts 'Please enter the color of the label :'
  color = gets.chomp
  puts 'Please enter the name of the publisher :'
  publisher = gets.chomp
  puts 'Please enter the date of publication'
  publish_date = gets.chomp
  puts 'What is the state of the cover ?'
  cover_state = gets.chomp
  book = Book.new(publish_date, publisher, cover_state)
  @labels << label = Label.new(title, color)
  @books << book
  label.add_item(book)
  puts 'Label and Book created successfully!'
end
