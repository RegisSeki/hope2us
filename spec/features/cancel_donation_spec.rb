require 'rails_helper'

feature 'user cancel donation' do
  scenario 'status canceled' do
    donation = create(:donation)

    login_as(donation.user)

    visit confirmation_donations_path

    click_on 'Cancelar doação'

    expect(page).to have_content 'A doação foi cancelada :('
    expect(page).to not_have_content donation.item.name
  end
end
