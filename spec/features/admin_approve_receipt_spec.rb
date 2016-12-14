require 'rails_helper'

feature 'Admin approve donation receipt' do
  scenario 'successfully' do
    admin_user = create(:admin_user)
    create(:donation)

    login_as(admin_user, scope: :admin_user)

    visit admin_donations_path

    click_on 'Ver comprovante'

    click_on 'Aprovar'

    expect(page).to have_content 'Aprovado'
  end
end
