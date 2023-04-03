class Genre
  attr_reader :id, :items
  attr_accessor :name

  def initialize(_id, name)
    @id = Random.rand(1..1000)
    @name = name
    @items = []
  end

  def to_h
    {
      name: @name
    }
  end

  def add_item(item)
    @items << item
    item.genre = self
  end
end
