class DonationsController < ApplicationController
  before_action :set_items
  before_action :build_donation, only: :create

  def new
  end

  def create
    if @service[:user].valid?
      sign_in(:user, @service[:user])

      flash[:errors] = @service[:errors]
      flash[:warnings] = @service[:warnings]

      redirect_to confirmation_donations_path
    else
      flash.now[:error] = 'Preencha os campos para contato corretamente'

      render :new
    end
  end

  private

  def set_items
    @items = Item.available
  end

  def build_donation
    @service = DonationBuilderService.new(params).builder
  end
end
