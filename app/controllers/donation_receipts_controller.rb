class DonationReceiptsController < ApplicationController
  def show
    @donation = Donation.find(params[:id])
  end

  def update
    @donation = Donation.find(params[:id])
    @donation.update(donation_receipt_params)

    redirect_to confirmation_donations_path
  end

  def edit
    @donation = Donation.find(params[:id])
  end

  private

  def donation_receipt_params
    params.permit(:image, :date_of_delivery)
  end
end
