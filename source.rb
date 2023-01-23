class Source
  attr_accessor :name
  @@items = []

  def initialize(name)
    @name = name
    @@items << self
  end

  def items
    Item.all.select { |item| item.source == self }
  end
end