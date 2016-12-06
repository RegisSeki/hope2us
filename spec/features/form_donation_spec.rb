require 'rails_helper'

feature 'form donation' do
  scenario 'user visit form donation' do
    items = create_list(:item, 3)

    visit donations_path

    items.each do |item|
      expect(page).to have_content item.name
    end

    expect(page).to have_field 'Nome'
  end

  scenario 'donation successfully' do
    items = create_list(:item, 3)
    user = build(:user)

    visit donations_path

    items.each do |item|
      select('1', from: item.name)
    end

    fill_in 'Nome', with: user.name
    fill_in 'Email', with: user.email
    fill_in 'Telefone', with: user.phone

    click_on 'Doar!'

    expect(page).to have_content user.name

    items.each do |item|
      expect(page).to have_content item.name
    end
  end
end
