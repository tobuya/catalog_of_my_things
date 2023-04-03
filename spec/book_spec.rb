# for testing
require 'date'
require_relative '../classes/book'

describe Book do
  context 'Testing the Book class' do
    it 'A newly created book has a title of type String' do
      book = Book.new('Queen Bee', 'Harry Potel', 'cover_state', '2012-02-20', 'J. K. Rowling')
      expect(book.name).not_to be_nil
      expect(book.name).to be_a(String)
    end

    it 'should detect the book title' do
      book = Book.new('title', 'name', 'cover_state', '2012-02-20', 'J. K. Rowling')
      expect(book.name).to eq 'title'
    end

    it 'should detect the book publisher' do
      book = Book.new('name', 'cover_state', 'publisher', '2005-07-10', 'J. K. Rowling')
      expect(book.publisher).to eq 'publisher'
    end

    it 'should detect the book cover_state' do
      book = Book.new('name', 'good', 'author', '2005-07-10', 'J. K. Rowling')
      expect(book.cover_state).to eq 'good'
    end

    it 'detect the book publish_date' do
      book = Book.new('name', 'author', 'cover_state', '2005-07-10', 'J. K. Rowling')
      expect(Date.parse(book.publish_date)).to eq Date.parse('2005-07-10')
    end

    it 'detect the book archive state' do
      book = Book.new('Queen Bee', 'Harry Potel', 'good', '2005-07-10', 'J. K. Rowling')
      expect(book.archived).to be false
    end
    it 'Should be archivable' do
      book = Book.new('Queen Bee', 'bad', 'Harry Potel', '2005-07-10', 'J. K. Rowling')
      expect(book.send(:can_be_archived?)).to be(true)
    end
  end
end
