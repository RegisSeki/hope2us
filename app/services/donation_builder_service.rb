class DonationBuilderService
  def initialize(params)
    @params = params
    @errors = []
  end

  def builder
    @user = fetch_user

    {
      user: @user,
      donations: fetch_donations,
      errors: @errors
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
    results = []
    @params[:items].each do |item, amount|
      donation = create_donation(item.to_i, amount.to_i)

      if donation.valid?
        results << donation
      else
        @errors << donation.errors[:item].first
      end
    end

    results
  end

  def create_donation(item_id, amount)
    item = Item.find(item_id)

    Donation.create(
      user: @user,
      item: item,
      amount: amount
    )
  end
end
