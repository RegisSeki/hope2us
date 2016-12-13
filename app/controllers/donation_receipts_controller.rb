class DonationReceiptsController < ApplicationController
  before_action :set_donation

  def show
  end

  def update
    if params[:image].blank? || params[:date_of_delivery].blank?
      flash.now[:error] = 'Preencha os campos corretamente!'
      render :edit
    else
      @donation.update(donation_receipt_params)
      redirect_to confirmation_donations_path
    end
  end

  def edit
  end

  private

  def set_donation
    @donation = Donation.find(params[:id])
  end

  def donation_receipt_params
    params.permit(:image, :date_of_delivery)
  end
end
