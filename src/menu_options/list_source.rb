require_relative '../classes/source'

def list_sources
  puts 'SOURCES:'
  @sources.each do |source|
    puts "Name: #{source.name}"
  end
end
