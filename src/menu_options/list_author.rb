require_relative '../classes/author'

def list_authors
  puts 'AUTHORS:'
  @authors.each do |author|
    puts "First Name: #{author.first_name}, Last Name: #{author.last_name}"
  end
end
