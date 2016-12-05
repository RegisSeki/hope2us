require 'rails_helper'

feature 'form donation' do
  scenario 'user visit form donation' do
    items = create_list(:item, 3)

    visit donations_path

    items.each do |item|
      expect(page).to have_content item.name
      expect(page).to have_content item.amount
    end

    expect(page).to have_button 'Doar!'
  end
end
