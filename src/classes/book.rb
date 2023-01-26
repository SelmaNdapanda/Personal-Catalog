require './../../item'

class Book < Item
  attr_accessor :publisher, :cover_state

  def initialize(publisher, cover_state)
    super(publish_date, archived)
    @publisher = publisher
    @cover_state = cover_state
  end

end
