require 'rails_helper'

feature 'Admin approve donation receipt' do
  scenario 'visit donation page to approve' do
    admin_user = create(:admin_user)
    donation = create(:donation, status: 'waiting_approval')

    login_as(admin_user, scope: :admin_user)

    visit admin_donations_path

    click_on 'Ver comprovante'

    expect(page).to have_link(
      'Aprovar', href: approve_admin_donation_path(donation.id)
    )
  end

  scenario 'approve donation successfully' do
    admin_user = create(:admin_user)
    donation = create(:donation, status: 'waiting_approval')

    login_as(admin_user, scope: :admin_user)

    visit admin_donation_path(donation.id)

    click_on 'Aprovar'

    expect(page).to have_content 'Aprovado'
  end
end
