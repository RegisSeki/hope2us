require 'rails_helper'

feature 'user see donations' do
  scenario 'when logged in' do
    donation = create(:donation, image: nil, status: 'pending_receipt')
    another_user = create(:user, email: 'outro@email.com')
    another_donation = create(:donation, user: another_user)

    login_as(donation.user)

    visit root_path

    click_on 'Minhas Doações'

    expect(page).to have_content donation.item.name
    expect(page).to have_link(
      'Enviar comprovante', href: edit_receipt_donation_path(donation)
    )
    expect(page).not_to have_content another_donation.item.name
  end

  scenario 'when not logged in' do
    visit root_path

    expect(page).to_not have_link(
      'Minhas Doações', href: confirmation_donations_path
    )
  end
end
