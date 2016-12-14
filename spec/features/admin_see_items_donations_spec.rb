require 'rails_helper'

feature 'admin see items donations' do
  scenario 'successfully' do
    admin_user = create(:admin_user)
    items = create_list(:item, 3)

    login_as(admin_user, scope: :admin_user)

    visit admin_donations_path

    click_on 'Itens'

    items.each do |item|
      expect(page).to have_content item.name
    end
  end
end
