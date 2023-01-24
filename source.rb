class Source
  attr_accessor :id, :name, :items

  def initialize(_id, name)
    @id = Random.Rand(1..1000)
    @name = name
    @items = []
  end
end
