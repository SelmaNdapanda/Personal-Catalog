require 'json'
require_relative '../classes/book'
require_relative '../classes/label'
require_relative '../../app'

def load_books
  return unless File.exist?('./src/preserve_data/books.json')

  file = File.open('./src/preserve_data/books.json')

  if file.empty?
    'Sorry, There is no book saved yet!'
  else
    books = JSON.parse(File.read('./src/preserve_data/books.json'))

    books.each do |book|
      book = Book.new(book['publisher'], book['cover_state'], book['publish_date'])
      @books << book
    end
  end
  file.close
end


