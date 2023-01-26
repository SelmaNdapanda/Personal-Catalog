require '../../item'

class Book < Item
  attr_accessor :publisher, :cover_state

  def initialize(publish_date, publisher, cover_state, archived: false)
    super(publish_date, archived)
    @publisher = publisher
    @cover_state = cover_state
  end

  def can_be_archived?
    super or @cover_state == 'bad'
  end
end
