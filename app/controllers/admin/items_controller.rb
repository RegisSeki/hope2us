module Admin
  class ItemsController < ApplicationController
    before_action :authenticate_admin_user!

    def index
      @items = Item.all
    end
  end
end
