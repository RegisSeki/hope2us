require 'rails_helper'

feature 'user cancel donation' do
  scenario 'status canceled' do
    donation = create(:donation)

    login_as(donation.user)

    visit confirmation_donations_path

    click_on 'Cancelar doação'

    expect(page).to have_content 'A doação foi cancelada'
    expect(page).to_not have_content donation.item.name
  end

  scenario 'correct amount item of canceled donation' do
    item = create(:item, amount: 3, reserved: 2)
    donation = create(:donation, item: item, amount: 2)

    login_as(donation.user)

    visit confirmation_donations_path

    click_on 'Cancelar doação'

    visit new_donation_path

    expect(page).to have_select(item.name, with_options: %w(5 4))
  end
end
