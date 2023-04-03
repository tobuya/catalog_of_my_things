require_relative '../item'

class Book < Item
  attr_accessor :publisher, :cover_state, :name

  def initialize(name, cover_state, publisher, publish_date, author)
    super(publish_date, archived)
    @name = name
    @publisher = publisher
    @cover_state = cover_state
    @publish_date = publish_date
    @author = author
  end

  def to_h
    {
      name: @name,
      publisher: @publisher,
      cover_state: @cover_state,
      publish_date: @publish_date
    }
  end

  private

  def can_be_archived?
    super || cover_state == 'bad'
  end
end
