require_relative '../../item'

class MusicAlbum < Item
  attr_reader :id
  attr_accessor :on_spotify

  def initialize(on_spotify, publish_date, archived: false, id: nil)
    super(id, publish_date, archived: archived)
    @on_spotify = on_spotify
  end

  private

  def can_be_archived?
    super && @on_spotify == true
  end
end
