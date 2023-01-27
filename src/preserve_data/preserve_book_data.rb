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
      book = Book.new(book['publish_date'], book['publisher'], book['cover_state'])
      @books << book
    end
  end
  file.close
end

def load_labels
  return unless File.exist?('./src/preserve_data/labels.json')

  file = File.open('./src/preserve_data/labels.json')

  if file.empty?
    'Sorry, There is no label saved yet!'
  else
    labels = JSON.parse(File.read('./src/preserve_data/labels.json'))

    labels.each do |label|
      label = Label.new(label['title'], label['color'])
      @labels << label
    end
  end
  file.close
end

def save_book(publisher, cover_state, publish_date)
  obj = {
    publisher: publisher,
    cover_state: cover_state,
    publish_date: publish_date
  }

  return unless File.exist?('./src/preserve_data/books.json')

  file = File.open('./src/preserve_data/books.json')

  if file.empty?
    book = [obj]
  else
    book = JSON.parse(File.read('./src/preserve_data/books.json'))
    book << obj
  end

  file.close

  myfile = File.open('./src/preserve_data/books.json', 'w')
  myfile.write(JSON.pretty_generate(book))
  myfile.close
end

def save_label(title, color)
  obj = {
    title: title,
    color: color
  }

  return unless File.exist?('./src/preserve_data/labels.json')

  file = File.open('./src/preserve_data/labels.json')

  if file.empty?
    label = [obj]
  else
    label = JSON.parse(File.read('./src/preserve_data/labels.json'))
    label << obj
  end

  file.close

  myfile = File.open('./src/preserve_data/labels.json', 'w')
  myfile.write(JSON.pretty_generate(label))
  myfile.close
end
