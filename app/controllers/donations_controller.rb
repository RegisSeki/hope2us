class DonationsController < ApplicationController
  before_action :build_donation, only: :create

  def index
    @items = Item.all
p  end

  def create
    sign_in(:user, @service[:user])

    redirect_to confirmation_donations_path
  end

  private

  def build_donation
    @service = DonationBuilderService.new(params).builder
  end
end
