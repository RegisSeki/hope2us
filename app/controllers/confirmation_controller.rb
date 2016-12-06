class ConfirmationController < ApplicationController
  def index
    @donations = current_user.donations.includes(:item)
  end
end
