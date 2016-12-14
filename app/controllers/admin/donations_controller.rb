module Admin
  class DonationsController < ApplicationController
    before_action :authenticate_admin_user!

    def index
      @donations = Donation.all
    end

    def show
      @donation = Donation.find(params[:id])
    end

    def approve
      @donation = Donation.find(params[:id])
      @donation.approved!
      update_donation_item

      redirect_to admin_donations_path
    end

    def confirm
      @donation = Donation.find(params[:id])
      @donation.confirmed!

      redirect_to admin_donations_path
    end

    private

    def donation_admin_params
      params.permit(:id, :status)
    end

    def update_donation_item
      item = @donation.item
      item.update(
        reserved: item.reserved - @donation.amount,
        confirmed: item.confirmed + @donation.amount
      )
    end
  end
end
