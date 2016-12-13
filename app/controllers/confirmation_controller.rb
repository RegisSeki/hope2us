class ConfirmationController < ApplicationController
  before_action :authenticate_user!

  def index
    @donations = current_user.donations.includes(:item).where.not(
      status: 'canceled'
    )
  end
end
