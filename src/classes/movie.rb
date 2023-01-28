require_relative './items'
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
      'silent' => @silent,
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
    movie = new(object['silent'], object['movie_name'], object['date'], archived: object['archived'],
                                                                        id: object['id'])
    source = JSON.parse(JSON.generate(object['source']), create_additions: true)
    source.add_item(movie)
    movie
  end
end
