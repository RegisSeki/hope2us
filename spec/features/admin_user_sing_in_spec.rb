require 'rails_helper'

feature 'admin user sign in'	do
  scenario 'from home page' do
    admin_user = create(:admin_user)

    visit root_path

    click_on 'Painel Administrativo'

    fill_in 'Email', with: admin_user.email
    fill_in 'Senha', with: admin_user.password

    within('form') do
      click_on 'Entrar'
    end

    expect(current_path).to eq(admin_donations_path)
    expect(page).to have_content(admin_user.email)
    expect(page).to have_link 'Sair'
  end

  scenario 'and sign out' do
    admin_user = create(:admin_user)

    login_as(admin_user, scope: :admin_user)

    visit root_path

    click_on 'Sair'

    expect(current_path).to eq(root_path)
    expect(page).to have_link('Admin')
    expect(page).not_to have_content(admin_user.email)
  end
end
