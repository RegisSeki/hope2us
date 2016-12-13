require 'rails_helper'

feature 'Admin approve donation receipt' do
  scenario 'successfully' do
    admin_user = create(:admin_user)
    item = create(:item)
    donation = create(:donation, item: item)

    login_as(admin_user, scope: :admin_user)

    visit root_path

    click_on 'Minhas Doações'

    click_on 'Ver Comprovante'

    click_on 'Aprovar'

    expect(page).to have_content 'Aprovado'
  end
end
