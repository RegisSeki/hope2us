require 'rails_helper'

RSpec.describe Item, type: :model do
  describe 'unavailable amounts' do
    it 'should return list of amount for select' do
      item = create(:item, amount: 5)

      expect(item.available_amounts).to eq([5, 4, 3, 2, 1])
    end
  end

  describe 'available items' do
    it 'should return list of available item' do
      item_one = create(:item, amount: 0)
      item_two = create(:item, amount: 5)

      expect(Item.available.size).to eq(1)
    end
  end
end
