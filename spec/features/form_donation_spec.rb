require 'rails_helper'

feature 'form donation' do
  scenario 'user visit form donation' do
    items = create_list(:item, 3)

    visit root_path

    click_on 'Faça sua doação'

    items.each do |item|
      expect(page).to have_content item.name
    end

    expect(page).to have_field 'Nome'
  end

  scenario 'donation successfully' do
    items = create_list(:item, 3)
    user = build(:user)

    visit new_donation_path

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

  scenario 'empty contact fields' do
    items = create_list(:item, 3)

    visit new_donation_path

    items.each do |item|
      select('1', from: item.name)
    end

    click_on 'Doar!'

    expect(page).to have_content('Preencha os campos para contato corretamente')
  end

  scenario 'donation with unavailable item' do
    item_one = create(:item, amount: 2)
    item_two = create(:item, amount: 2)
    user = build(:user)

    visit new_donation_path

    select('1', from: item_one.name)
    select('1', from: item_two.name)
    fill_in 'Nome', with: user.name
    fill_in 'Email', with: user.email
    fill_in 'Telefone', with: user.phone

    item_two.update(amount: 0)

    click_on 'Doar!'

    expect(page).to have_content user.name
    expect(page).to have_content item_one.name
    expect(page).to have_content "Todos #{item_two.name} foram doados"
  end

  scenario 'item amount with less then required' do
    item_one = create(:item, amount: 5)
    item_two = create(:item, amount: 2)
    user = build(:user)

    visit new_donation_path

    select('5', from: item_one.name)
    select('1', from: item_two.name)
    fill_in 'Nome', with: user.name
    fill_in 'Email', with: user.email
    fill_in 'Telefone', with: user.phone

    item_one.update(amount: 2)

    click_on 'Doar!'

    expect(page).to have_content user.name
    expect(page).to have_content item_one.name
    expect(page).to have_content item_two.name
    expect(page).to have_content(
      "Apenas 2/5 #{item_one.name} disponíveis"
    )
  end
end
