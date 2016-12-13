require 'rails_helper'

feature 'recent donations' do
  scenario 'last confirmed donations in homepage' do
    user = create(:user)
    donations = create_list(:donation, 3, user: user, status: 'confirmed')

    visit root_path

    donations.each do |donation|
      expect(page).to have_content(donation.item.name)
    end
  end
end
