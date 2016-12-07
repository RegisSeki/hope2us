require 'rails_helper'

RSpec.describe Item, type: :model do
  describe 'unavailable amounts' do
    it 'should return list of amount for select' do
      item = create(:item, amount: 5)

      expect(item.available_amounts).to eq([5, 4, 3, 2, 1])
    end
  end
end
