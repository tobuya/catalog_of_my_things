# label class
class Label
    attr_accessor :label
    def initialize(id, title, color, items)
        @id
        @title = title
        @color = color
        @items = []
    end

    def add_item(item)
      @items << item
      item.label = self
    end
end