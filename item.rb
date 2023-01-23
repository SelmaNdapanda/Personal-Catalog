class Item
  attr_reader :genre, :author, :source, :label
  attr_accessor :publish_date, :archived

  def initialize(publish_date)
    @id = Random.rand(1..1000)
    @publish_date = publish_date
    @archived = archived
  end
end
