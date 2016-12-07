require 'rails_helper'

describe DonationBuilderService do
  context 'Successfully' do
    let!(:item_one) { create(:item, amount: 5) }
    let!(:item_two) { create(:item, amount: 3) }
    let!(:params) do
      {
        items: {
          item_one.id => '1',
          item_two.id => '1'
        },
        user: {
          name: 'Usuário',
          phone: '1234-1234',
          email: 'usuario@email.com'
        }
      }
    end
    subject { described_class.new(params).builder }

    it 'should return user created' do
      expect(subject[:user].email).to eq('usuario@email.com')
      expect(subject[:user].phone).to eq('1234-1234')
      expect(subject[:user].name).to eq('Usuário')
    end

    it 'should return amount of donations corrected' do
      expect(subject[:donations].size).to eq(2)
    end
  end

  context 'Unavailable items for donation' do
    let!(:item_one) { create(:item, amount: 0) }
    let!(:params) do
      {
        items: { item_one.id => '1' },
        user: {
          name: 'Usuário',
          phone: '1234-1234',
          email: 'usuario@email.com'
        }
      }
    end
    subject { described_class.new(params).builder }

    it 'should return error for item unavailable' do
      expect(subject[:errors].size).to eq(1)
    end
  end

  context 'Amount selected is more then amount available for item' do
    let!(:item_one) { create(:item, amount: 3) }
    let!(:params) do
      {
        items: { item_one.id => '5' },
        user: {
          name: 'Usuário',
          phone: '1234-1234',
          email: 'usuario@email.com'
        }
      }
    end
    subject { described_class.new(params).builder }

    it 'should return message for item with amount less than required' do
      expect(subject[:warnings].size).to eq(1)
    end
  end
end
