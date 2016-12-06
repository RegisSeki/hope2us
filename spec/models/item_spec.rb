require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = create(:item, amount: 5)
  end

  context 'available amounts' do
    it '#available_amounts' do
      expect(@item.available_amounts).to eq([5, 4, 3, 2, 1])
    end
  end
end
