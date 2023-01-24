require_relative './item'

class Movie < Item
  attr_reader :id
  attr_accessor :silent

  def initialize(silent, publish_date, archived: false)
    super(id, publish_date, archived: archived)
    @silent = silent
  end
end
