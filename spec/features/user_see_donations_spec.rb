require 'rails_helper'

feature 'user see donations' do
  scenario 'when logged in' do
    donation = create(:donation)

    login_as(donation.user)

    visit root_path

    expect(page).to have_link(
      'Minhas Doações', href: confirmation_donations_path
    )
  end

  scenario 'when not logged in' do
    visit root_path

    expect(page).to_not have_link(
      'Minhas Doações', href: confirmation_donations_path
    )
  end
end
