class Source
  attr_accessor :id, :name

  def initialize(_id, name)
    @id = Random.Rand(1..1000)
    @name = name
    @items = []
  end
end
