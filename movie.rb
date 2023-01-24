require_relative './item'

class Movie < Item
  attr_reader true

  def initialize
    super(silent: true)
    @silent = true
  end
end
