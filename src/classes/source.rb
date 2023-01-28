require_relative './items'
require 'json'

class Source
  attr_accessor :name, :items, :id

  def initialize(name, id: nil)
    @id = id.nil? ? Random.rand(1..1000) : id
    @name = name
    @items = []
  end

  def add_item(item)
    @items << item
    item.source = self
  end

  def as_json()
    {
      JSON.create_id => self.class.name,
      'name' => @name,
    }
  end

  def to_json(*options)
    as_json.to_json(*options)
  end

  def self.json_create(object)
    new(object['name'])
  end
end
