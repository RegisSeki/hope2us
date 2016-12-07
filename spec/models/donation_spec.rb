require 'rails_helper'

RSpec.describe Donation, type: :model do
  describe 'unavailable item' do
    it 'should not save with unavailable item' do
      item = create(:item, amount: 0)
      user = create(:user)
      donation = build(:donation, user: user, item: item, amount: 2)

      expect(donation.valid?).to be_falsey
    end
  end
end
