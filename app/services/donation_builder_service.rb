class DonationBuilderService
  def initialize(params)
    @params = params
  end

  def builder
    @user = fetch_user

    {
      user: @user,
      donations: fetch_donations
    }
  end

  private

  def fetch_user
    if User.where(email: @params[:user][:email]).blank?
      create_user
    else
      User.find_by(email: @params[:user][:email])
    end
  end

  def create_user
    User.create(
      email: @params[:user][:email],
      name: @params[:user][:name],
      phone: @params[:user][:phone],
      password: fetch_password
    )
  end

  def fetch_password
    @params[:user][:email].split('@').first
  end

  def fetch_donations
    donations = []
    @params[:items].each do |item_id, amount|
      donations << Donation.create(
        user_id: @user.id,
        item_id: item_id,
        amount: amount.to_i
      )
    end

    donations
  end
end
