require 'rails_helper'

feature do
	scenario 'user'do
		user = build(:user)

		visit donation_path

		fill_in 'Nome', with: user.name
		fill_in 'Email', with: user.email
		fill_in 'Telefone', with: user.phone

		within('form') do
			click_on 'Continuar'
		end

		expect(current_path).to eq(donation_path)
		expect(page).to have_content ("Olá, #{user.email}.
		Confira abaixo suas doações")
	end
end
