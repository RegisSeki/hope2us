require 'rails_helper'

feature 'send receipt donation' do
  scenario 'receipt donation successfully' do
    donation = create(:donation)

    visit confirmation_donations_path

    click_on 'Enviar comprovante'

    fill_in 'Data de entrega', with: '10/12/2016'

    expect(page).to have_content donation.delivery_of_date
    expect(page).to have_content donation.image
  end
end
