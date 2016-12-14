require 'rails_helper'

describe DonationBuilderService do
  context 'Successfully' do
    let!(:item_one) { create(:item, amount: 5) }
    let!(:item_two) { create(:item, amount: 3) }
    let!(:args) do
      {
        params: {
          items: {
            item_one.id => '1',
            item_two.id => '1'
          },
          user: {
            name: 'Usuário',
            phone: '1234-1234',
            email: 'usuario@email.com'
          }
        },
        current_user: nil
      }
    end
    subject { described_class.new(args).builder }

    it 'should return user created' do
      expect(subject[:user].email).to eq('usuario@email.com')
      expect(subject[:user].phone).to eq('1234-1234')
      expect(subject[:user].name).to eq('Usuário')
    end

    it 'should return amount of donations corrected' do
      expect(subject[:donations].size).to eq(2)
    end
  end

  context 'email already exist' do
    let!(:user) do
      create(
        :user,
        name: 'Usuário',
        phone: '1234-1234',
        email: 'usuario@email.com'
      )
    end
    let!(:item_one) { create(:item, amount: 5) }
    let!(:item_two) { create(:item, amount: 3) }
    let!(:args) do
      {
        params: {
          items: {
            item_one.id => '1',
            item_two.id => '1'
          },
          user: {
            name: user.name,
            phone: user.phone,
            email: user.email
          }
        },
        current_user: nil
      }
    end
    subject { described_class.new(args).builder }

    it 'should return info of user exist' do
      expect(subject[:user].email).to eq(user.email)
      expect(subject[:user].phone).to eq(user.phone)
      expect(subject[:user].name).to eq(user.name)
    end

    it 'should return amount of donations corrected' do
      expect(subject[:donations].size).to eq(2)
    end
  end

  context 'empty user params' do
    let!(:item_one) { create(:item, amount: 5) }
    let!(:item_two) { create(:item, amount: 3) }
    let!(:args) do
      {
        params: {
          items: {
            item_one.id => '1',
            item_two.id => '1'
          },
          user: {}
        },
        current_user: nil
      }
    end
    subject { described_class.new(args).builder }

    it 'should return not valid user' do
      expect(subject[:user]).to_not be_valid
    end

    it 'should return zero donations' do
      expect(subject[:donations].size).to be_zero
    end
  end

  context 'Unavailable items for donation' do
    let!(:item_one) { create(:item, amount: 0) }
    let!(:args) do
      {
        params: {
          items: { item_one.id => '1' },
          user: {
            name: 'Usuário',
            phone: '1234-1234',
            email: 'usuario@email.com'
          }
        },
        current_user: nil
      }
    end

    subject { described_class.new(args).builder }

    it 'should return error for item unavailable' do
      expect(subject[:errors]).to include("Todos #{item_one.name} foram doados")
    end
  end

  context 'Amount selected is more then amount available for item' do
    let!(:item_one) { create(:item, amount: 3) }
    let!(:args) do
      {
        params: {
          items: { item_one.id => '5' },
          user: {
            name: 'Usuário',
            phone: '1234-1234',
            email: 'usuario@email.com'
          }
        },
        current_user: nil
      }
    end
    let!(:message) { "Apenas 3 de 5 #{item_one.name} disponíveis" }

    subject { described_class.new(args).builder }

    it 'should return message for item with amount less than required' do
      expect(subject[:warnings]).to include(message)
    end
  end

  context 'When user already signed_in' do
    let!(:user) { create(:user) }
    let!(:item_one) { create(:item, amount: 5) }
    let!(:item_two) { create(:item, amount: 3) }
    let!(:args) do
      {
        params: {
          items: {
            item_one.id => '1',
            item_two.id => '1'
          }
        },
        current_user: user
      }
    end

    before do
      login_as user
    end

    subject { described_class.new(args).builder }

    it 'should return infos of logged user' do
      expect(subject[:user].email).to eq(user.email)
      expect(subject[:user].phone).to eq(user.phone)
      expect(subject[:user].name).to eq(user.name)
    end

    it 'should return amount of donations corrected' do
      expect(subject[:donations].size).to eq(2)
    end
  end
end
