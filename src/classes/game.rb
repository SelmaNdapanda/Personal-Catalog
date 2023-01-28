require_relative '../../item'
require 'date'
require 'json'

class Game < Item
  attr_reader :id
  attr_accessor :multiplayer, :last_played_at

  def initialize(publish_date, multiplayer, last_played_at)
    super(id, publish_date, archived: archived)
    @multiplayer = multiplayer
    @last_played_at = last_played_at
  end

  private

  def can_be_archived?
    last_played_date = DateTime.parse(@last_played_at).to_date
    archived = (Date.today.year - last_played_date.year) > 2
    super && archived
  end

  public

  def as_json()
    {
      JSON.create_id => self.class.name,
      'multiplayer' => @multiplayer,
      'last_played_at' => @last_played_at,
      'publish_date' => @publish_date,
      'archived' => @archived,
      'id' => @id,
      'author' => @author
    }
  end

  def to_json(*options)
    as_json.to_json(*options)
  end

  def self.json_create(object)
    game = new(object['multiplayer'], object['last_played_at'], object['publish_date'], archived: object['archived'],
                                                                                        id: object['id'])
    author = JSON.parse(JSON.generate(object['author']), create_additions: true)
    author.add_item(game)
    game
  end
end
