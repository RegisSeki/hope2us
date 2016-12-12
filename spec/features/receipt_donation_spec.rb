require 'rails_helper'

feature 'send receipt donation' do
  scenario 'receipt donation successfully' do
    donation = create(:donation)

    sign_in(donation.user)

    visit confirmation_donations_path

    fill_in 'Data de entrega', with: '10/12/2016'

    click_on 'Enviar comprovante'

    expect(page).to have_content donation.delivery_of_date
  end
end
