require_relative '../classes/author'
require_relative '../item'
require 'date'

describe Author do
  author = Author.new('Micheal', 'Johnson')
  item = Item.new(Date.today, true)
  context 'When testing Author class' do
    it 'Should check state of author name' do
      expect(author.first_name).not_to be_nil
      expect(author.last_name).to be_a(String)
    end

    it 'Should check if author first name is Micheal' do
      expect(author.last_name).to eq 'Johnson'
      expect(author.first_name).to eq 'Micheal'
    end

    it 'Should add new class object to array' do
      author.add_item(item)
      expect(author.items[0]).to eq item
    end
  end
end
