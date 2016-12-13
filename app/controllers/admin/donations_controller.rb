module Admin
  class DonationsController < ApplicationController
    before_action :authenticate_admin_user!

    def index
      @donations = Donation.all
    end
  end
end
