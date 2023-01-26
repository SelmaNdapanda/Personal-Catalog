require_relative '../../item'

class Label
  attr_reader :title, :color
  @allitems = []

  def initialize(title, color)
    @id = Random.rand(1..1000)
    @title = title
    @color = color
    @@allitems << self
  end
end