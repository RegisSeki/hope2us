require 'rails_helper'

feature 'send receipt donation' do
	scenario 'receipt donation successfully' do
		donation = build(:donation)

		visit confirmation_donations_path

		click_on 'Enviar comprovante'
	end
end
