class HomeController < ApplicationController
  def index
    @donations = Donation.includes(:item).where(
      status: 'confirmed'
    ).order('created_at desc').first(3)
  end
end
