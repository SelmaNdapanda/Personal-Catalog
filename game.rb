require_relative './item'
require 'date'

class Game < Item
  attr_accessor :multiplayer, :last_played_at, :publish_date, :archived

  def initialize(publish_date, multiplayer, last_played_at)
    super(publish_date)
    @multiplayer = multiplayer
    @last_played_at = last_played_at
  end

  def can_be_archived?
    last_played_date = DateTime.parse(@last_played_at).to_date
    archived = (Date.today.year - last_played_date.year) > 2
    super && archived
  end
end
