require_relative './item'

class Movie < Item
  attr_reader :id
  attr_accessor :silent

  def initialize(publish_date, archived: false, silent: true)
    super(id, publish_date, archived: archived)
    @silent = silent
  end

    def can_be_archived?()
    (can_be_archived? || @silent)
  end
end
