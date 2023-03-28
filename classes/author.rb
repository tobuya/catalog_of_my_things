class Author
  attr_reader :id
  attr_accessor :first_name, :last_name, :items

  def initialize(first_name, last_name)
    @id = Random.rand(1..1000)
    @first_name = first_name
    @last_name = last_name
    @items = [item1, item2, item3, item4, item5, item6]
  end

  def add_item(item)
    # saving each item object in an array
    @items << item
    item.author = self
  end
end
