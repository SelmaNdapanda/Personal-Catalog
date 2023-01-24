require_relative './item'

class Movie < Item
  attr_reader true

  def initialize(true)
    @silent = true
  end
end
