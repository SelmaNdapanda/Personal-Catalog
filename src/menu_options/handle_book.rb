require '../../book'

@books = []

def list_books
  @books&.each do |book|
    puts "Publisher: #{book.publisher}, Cover state: #{book.cover_state}, Published date: #{book.publish_date}"
  end
end
