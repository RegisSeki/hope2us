require 'rails_helper'

feature 'admin confirmed donation' do
  scenario 'successfully' do
    admin_user = create(:admin_user)
    create(:donation)

    login_as(admin_user, scope: :admin_user)

    visit admin_donations_path

    click_on 'Ver comprovante'

    click_on 'Aprovar'

    click_on 'Confirmar doação'

    expect(page).to have_content 'Confirmado'
  end
end
