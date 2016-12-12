require 'rails_helper'

feature 'receipt donation' do
  scenario 'receipt donation successfully' do
    donation = create(:donation)

    login_as(donation.user)

    visit edit_receipt_donation_donation_path(donation.id)

    fill_in 'Data de entrega', with: '10/12/2016'
    attach_file 'image', Rails.root.join(
      'spec', 'support', 'images', 'forninho.jpg'
    )

    click_on 'Confirmar doação!'

    expect(page).to have_link 'Ver comprovante',
                              href: receipt_donation_path(donation.id)
  end

  scenario 'receipt donation empty image' do
    donation = create(:donation)

    login_as(donation.user)

    visit edit_receipt_donation_donation_path(donation.id)

    fill_in 'Data de entrega', with: '10/12/2016'

    click_on 'Confirmar doação!'

    expect(page).to have_content('Preencha os campos corretamente!')
  end

  scenario 'empty date' do
    donation = create(:donation)

    login_as(donation.user)

    visit edit_receipt_donation_donation_path(donation.id)

    fill_in 'Data de entrega', with: ''

    click_on 'Confirmar doação!'

    expect(page).to have_content('Preencha os campos corretamente!')
  end
end
