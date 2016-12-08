class DonationReceiptsController < ApplicationController

	def update
		@donation = Donation.find(params[:id])
		@donation.update(image: params[:image])
	end

	def edit
		@donation = Donation.find(params[:id])
	end
end
