require_relative '../../item'

class Source
  attr_accessor :id, :name, :items

  def initialize(name)
    @id = Random.new.rand(10_000)
    @name = name
    @items = []
  end

  def add_items(item)
    @items << item
    item.source = self
  end
end
