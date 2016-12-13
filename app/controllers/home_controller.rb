class HomeController < ApplicationController
  def index
    @donations = Donation.includes(:item).where(status: 'confirmed')
  end
end
