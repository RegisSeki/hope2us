class DonationReceiptsController < ApplicationController
  def show
    @donation = Donation.find(params[:id])
  end

  def update
    @donation = Donation.find(params[:donation_id])
    if @donation.update(donation_receipt_params)
      redirect_to confirmation_donations_path
    else
      flash.now[:error] = 'Preencha os campos corretamente!'
      render :edit
    end
  end

  def edit
    @donation = Donation.find(params[:id])
  end

  private

  def donation_receipt_params
    params.permit(:image, :date_of_delivery)
  end
end
