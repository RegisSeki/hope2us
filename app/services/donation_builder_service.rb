class DonationBuilderService
  def initialize(params)
    @params = params
    @errors = []
    @donations = []
  end

  def builder
    @user = fetch_user
    fetch_donations
    {
      user: @user,
      donations: @donations,
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
    @params[:items].each do |item, amount|
      item = Item.find(item.to_i)

      create_donation(item, amount.to_i)
    end
  end

  def create_donation(item, amount)
    donation = Donation.create(user: @user, item: item, amount: amount)

    if donation.valid?
      update_item(item, amount)

      @donations << donation
    else
      @errors << donation.errors[:item].first
    end
  end

  def update_item(item, amount)
    valid_amount = [amount, item.amount].min

    item.update(
      amount: item.amount - valid_amount,
      reserved: item.reserved + valid_amount
    )
  end
end
