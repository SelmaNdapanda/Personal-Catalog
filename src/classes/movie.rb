require_relative '../../item'
require 'json'

class Movie < Item
  attr_reader :id
  attr_accessor :silent, :movie_name

  def initialize(silent, movie_name, date, archived: false, id: nil)
    super(id, date, archived: archived)
    @silent = silent
    @movie_name = movie_name
  end

  private

  def can_be_archived?
    super || @silent == true
  end

  public

  def as_json()
    {
      JSON.create_id => self.class.name,
      'on_spotify' => @silent,
      'movie_name' => @movie_name,
      'date' => @publish_date,
      'archived' => @archived,
      'id' => @id,
      'source' => @source
    }
  end

  def to_json(*options)
    as_json.to_json(*options)
  end

  def self.json_create(object)
    album = new(object['silent'], object['movie_name'], object['date'], archived: object['archived'],
                                                                        id: object['id'])
    author = JSON.parse(JSON.generate(object['author']), create_additions: true)
    label = JSON.parse(JSON.generate(object['label']), create_additions: true)
    source = JSON.parse(JSON.generate(object['genre']), create_additions: true)
    author.add_item(album)
    label.add_item(album)
    source.add_item(album)
    album
  end
end
