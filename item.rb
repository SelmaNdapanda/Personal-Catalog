class Item
  attr_accessor :genre, :author, :source, :label, :publish_date, :archived

  @allitems = []

  def initialize(published_date)
    @id = Random.rand(1..1000)
    @published_date = published_date
    @archived = false
    @allitems << self
  end

  private

  def can_be_archived?
    (Time.new.year - @publish_date) > 10
  end

  def move_to_archive()
    @archived = true if can_be_archived?
  end
end
