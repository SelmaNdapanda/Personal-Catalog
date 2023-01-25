require_relative './item'

class Genre
  attr_reader :items

  def initialize(name)
    @id = Random.new.rand(10_000)
    @name = name
    @items = []
  end

    def add_item(item)
    item.genre(self)
    items.push(item)
  end
end



