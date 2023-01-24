require_relative './item'

class Movie < Item
  attr_reader true

  def initialize
    super(true)
    @silent = true
  end
end
