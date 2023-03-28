# book class
class Book
    attr_accessor :publisher, :cover_state, :name
    def initialize(name, cover_state, publisher)
        super(publish_date)
      @name = name
      @publisher = publisher
      @cover_state = cover_state
    end

    def can_be_archived?()
        super || cover_state == 'bad'
    end
end
