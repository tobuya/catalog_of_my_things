# for testing
require 'date'
require_relative '../item'

describe Item do
  let(:publish_date) { Date.new(2010, 1, 1) }
  let(:archived) { false }
  let(:item) { Item.new(publish_date, archived) }

  describe '#move_to_archive' do
    context 'when item can be archived' do
      it 'should set the archived status to true' do
        allow(item).to receive(:can_be_archived?).and_return(true)
        item.move_to_archive
        expect(item.instance_variable_get(:@archived)).to eq(true)
      end
    end

    context 'when item cannot be archived' do
      it 'should not set the archived status to true' do
        allow(item).to receive(:can_be_archived?).and_return(false)
        item.move_to_archive
        expect(item.instance_variable_get(:@archived)).to eq(false)
      end
    end
  end
end
