require 'rails_helper'

RSpec.describe Item, type: :model do
  describe 'available amounts' do
    it 'should return list of available amount for select' do
      item = create(:item, amount: 5)

      expect(item.available_amounts).to eq([5, 4, 3, 2, 1])
    end
  end

  describe 'available items' do
    it 'should return list of available item' do
      create(:item, amount: 0)
      create(:item, amount: 5)

      expect(Item.available.size).to eq(1)
    end
  end

  describe 'total amount' do
    it 'should sum of amount, reserved and confirmed' do
      item = create(:item, amount: 5, reserved: 1, confirmed: 0)

      expect(item.total_amount).to eq(6)
    end
  end
end
