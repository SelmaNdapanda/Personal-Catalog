require_relative '../../item'
require 'json'

class Author
  attr_reader :id
  attr_accessor :first_name, :last_name, :items

  def initialize(first_name, last_name, id: nil)
    @id = id.nil? ? generate_id : id
    @first_name = first_name
    @last_name = last_name
    @items = []
  end

  def add_items(item)
    @items << item
    item.author = self
  end

  private

  def generate_id
    rand(1..1000)
  end

  public

  def as_json()
    {
      JSON.create_id => self.class.name,
      'first_name' => @first_name,
      'last_name' => @last_name,
      'id' => @id
    }
  end

  def to_json(*options)
    as_json.to_json(*options)
  end

  def self.json_create(object)
    new(object['first_name'], object['last_name'], id: object['id'])
  end
end
