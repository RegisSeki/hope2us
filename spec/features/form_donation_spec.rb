require 'rails_helper'

feature 'form donation' do
  scenario 'user visit form donation' do
    items = create_list(:item, 3)
    user = build(:user)

    visit donations_path

    items.each do |item|
      expect(page).to have_content item.name
      expect(page).to have_content item.amount
    end

    fill_in 'Nome', with: user.name
    fill_in 'Email', with: user.email
    fill_in 'Telefone', with: user.phone

    expect(page).to have_button 'Doar!'

    click_on 'Doar'

    expect(page).to have_content "Olá #{user.name}"
  end
end
