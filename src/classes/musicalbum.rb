include '../../item.rb'

class MusicAlbum < Item
  attr_reader :archived, :date, :id

  def initialize(id, on_spotify, date, archived: false)
    super(id, date, archived: archived)
    @on_spotify = on_spotify
  end

  private

  def can_be_archived?
    super && @on_spotify == true
    false
  end
end
