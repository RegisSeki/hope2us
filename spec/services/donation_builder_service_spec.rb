require 'rails_helper'

describe DonationBuilderService do
  let!(:item_one) { create(:item, amount: 5) }
  let!(:item_two) { create(:item, amount: 3) }

  context 'Successfully create' do
    let!(:params) do
      {
        items: {
          item_one.id => item_one.amount,
          item_two.id => item_two.amount
        },
        user: {
          name: 'Usuário',
          phone: '1234-1234',
          email: 'usuario@email.com'
        }
      }
    end
    subject { described_class.new(params).builder }

    it 'return user created' do
      expect(subject[:user].email).to eq('usuario@email.com')
      expect(subject[:user].phone).to eq('1234-1234')
      expect(subject[:user].name).to eq('Usuário')
    end

    it 'return amount of donations corrected' do
      expect(subject[:donations].size).to eq(2)
    end
  end
end
