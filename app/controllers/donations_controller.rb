class DonationsController < ApplicationController
  before_action :set_items
  before_action :build_donation, only: :create

  def new
  end

  def create
    if @service[:user].valid?
      sign_in(:user, @service[:user])
      flash[:warnings] = @service[:warnings]
      flash[:errors] = @service[:errors]

      donation_mailer

      redirect_to confirmation_donations_path
    else
      flash[:error] = 'Preencha os campos para contato corretamente'

      redirect_to new_donation_path
    end
  end

  def cancel
    @donation = Donation.find(params[:id])
    @donation.canceled!

    update_amount_item

    flash[:notice] = 'A doação foi cancelada'

    redirect_to confirmation_donations_path
  end

  private

  def set_items
    @items = Item.available
  end

  def build_donation
    @service = DonationBuilderService.new(params).builder
  end

  def donation_mailer
    UserMailer.donation_mailer(@service[:user], @service[:donations]).deliver
  end

  def update_amount_item
    item = @donation.item

    item.update(
      amount: item.amount + @donation.amount,
      reserved: item.reserved - @donation.amount
    )
  end
end
