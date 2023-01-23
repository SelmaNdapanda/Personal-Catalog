class Item
  attr_accessor :genre, :author, :source, :label

  def initialize(publish_date)
    @publish_date = publish_date
    private
    @id = Random.rand(1..1000)
    @archived
  end
end
