require 'rails_helper'

feature 'admin confirm donations' do
  scenario 'successfully' do
    admin_user = create(:admin_user)
    create(:donation, status: 'approved')

    login_as(admin_user, scope: :admin_user)

    visit admin_donations_path

    click_on 'Confirmar doação'

    expect(page).to have_content I18n.t('donation_status.confirmed')
  end
end
