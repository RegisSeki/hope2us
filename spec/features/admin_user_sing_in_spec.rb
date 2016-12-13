require 'rails_helper'

feature 'admin user sign in'	do
  scenario 'from home page' do
    admin_user = create(:admin_user)

    visit root_path

    click_on 'Admin'

    fill_in 'Email', with: admin_user.email
    fill_in 'Senha', with: admin_user.password

    within('form') do
      click_on 'Entrar'
    end
  end
end
