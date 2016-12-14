require 'rails_helper'

feature 'user view recent donations' do
  scenario 'confirmed donations in homepage' do
    user = create(:user)
    donations = create_list(:donation, 3, user: user, status: 'confirmed')

    visit root_path

    donations.each do |donation|
      expect(page).to have_content(donation.item.name)
    end
  end

  scenario 'only last three confirmed donations' do
    user = create(:user)
    old_donation = create(:donation, user: user, status: 'confirmed')
    create_list(:donation, 3, user: user, status: 'confirmed')

    visit root_path

    expect(page).to_not have_content(old_donation.item.name)
  end
end
