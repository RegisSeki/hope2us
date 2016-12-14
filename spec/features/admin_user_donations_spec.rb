require 'rails_helper'

feature 'admin user see donations'	do
  scenario 'when logged in' do
    admin_user = create(:admin_user)
    donation = create(:donation)

    login_as(admin_user, scope: :admin_user)

    visit admin_donations_path

    expect(page).to have_content donation.id
    expect(page).to have_content donation.item.name
    expect(page).to have_content donation.amount
    expect(page).to have_content 'Aguardando Recibo'
  end
end
