require 'rails_helper'

feature 'admin donations page' do
  scenario 'donations list' do
    user = create(:user)
    admin_user = create(:admin_user)
    donations = create_list(:donation, 3, user: user, image: nil, status: 'pending_receipt')

    login_as(admin_user, scope: :admin_user)

    visit root_path

    click_on 'Doações'

    expect(page).to have_content 'Lista de doações'
    donations.each do |donation|
      expect(page).to have_content donation.item.name
      expect(page).to have_content donation.amount
      expect(page).to have_content 'Aguardando recibo'
    end
  end

  scenario 'donations without receipt' do
    admin_user = create(:admin_user)
    donation = create(:donation, image: nil)

    login_as(admin_user, scope: :admin_user)

    visit root_path

    click_on 'Doações'

    expect(page).to have_content donation.item.name
    expect(page).to have_content donation.amount
    expect(page).to have_content 'Aguardando recibo'
  end

  scenario 'donations with receipt and not approved' do
    admin_user = create(:admin_user)
    donation = create(:donation)
    donation.waiting_approval!

    login_as(admin_user, scope: :admin_user)

    visit root_path

    click_on 'Doações'

    expect(page).to have_content donation.item.name
    expect(page).to have_content donation.amount
    expect(page).to have_content 'Aguardando aprovação'
  end

  scenario 'donations aproved and not confirmed' do
    admin_user = create(:admin_user)
    donation = create(:donation)
    donation.approved!

    login_as(admin_user, scope: :admin_user)

    visit root_path

    click_on 'Doações'

    expect(page).to have_content donation.item.name
    expect(page).to have_content donation.amount
    expect(page).to have_content 'Aprovado'
  end

  scenario 'donations confirmed' do
    admin_user = create(:admin_user)
    donation = create(:donation)
    donation.confirmed!

    login_as(admin_user, scope: :admin_user)

    visit root_path

    click_on 'Doações'

    expect(page).to have_content donation.item.name
    expect(page).to have_content donation.amount
    expect(page).to have_content 'Confirmado'
  end
end
