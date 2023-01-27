require_relative '..\classes\book'
require_relative '..\classes\label'

@books = []
@labels = []

def list_books
  puts 'Here are all the books'
  @books&.each do |book|
    puts "Publisher: #{book.publisher}, Cover state: #{book.cover_state}, Published date: #{book.publish_date}"
  end
end

def list_labels
  puts 'Here are all the labels'
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
  puts 'Please enter the date of publication [YYYY-MM-DD] :'
  publish_date = DateTime.parse(gets.chomp).to_date
  puts 'What is the state of the cover ?'
  cover_state = gets.chomp
  book = Book.new(publish_date, publisher, cover_state)
  @labels << label = Label.new(title, color)
  save_label(title, color)
  @books << book
  label.add_item(book)
  save_book(publisher, cover_state, publish_date)
  puts 'Label and Book created successfully!'
end
