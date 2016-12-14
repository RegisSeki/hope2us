require 'rails_helper'

feature 'user see donations' do
  scenario 'when logged in' do
    donation = create(:donation, image: nil, status: 'pending_receipt')

    login_as(donation.user)

    visit root_path

    click_on 'Minhas Doações'

    expect(page).to have_content donation.item.name
    expect(page).to have_link(
      'Enviar comprovante', href: edit_receipt_donation_path(donation)
    )
    expect(page).to have_link(
      'Cancelar doação', href: cancel_donation_path(donation)
    )
  end

  scenario 'when not logged in' do
    visit root_path

    expect(page).to_not have_link(
      'Minhas Doações', href: confirmation_donations_path
    )
  end
end
