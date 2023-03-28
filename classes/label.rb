# label class
class Label
  attr_accessor :title, :color, :item, :id

  def initialize(title, color, _items)
    @id = Random.rand(1..1000)
    @title = title
    @color = color
    @items = []
  end

  def add_item(item)
    @items << item
    item.label = self
  end
end
