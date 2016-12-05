class DonationsController < ApplicationController
  def index
    @items = Item.all
  end
end
