class Admin
  class DonationsController < ApplicationController
    before_action :authenticate_admin_user!
  end
end
