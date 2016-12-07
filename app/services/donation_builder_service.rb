class DonationBuilderService
  def initialize(params)
    @params = params
    @errors = []
    @donations = []
    @warnings = []
  end

  def builder
    @user = fetch_user
    fetch_donations

    {
      user: @user,
      donations: @donations,
      errors: @errors,
      warnings: @warnings
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
    donation = Donation.new(user: @user, item: item, amount: amount)

    if donation.valid?
      validate_donation(donation, item)
    else
      @errors << donation.errors[:item].first
    end
  end

  def validate_donation(donation, item)
    valid_amount = [donation.amount, item.amount].min

    if donation.amount > item.amount
      warning_message(donation, item, valid_amount)
      update_item(item, valid_amount)
    else
      @donations << donation.save
      update_item(item, donation.amount)
    end
  end

  def warning_message(donation, item, valid_amount)
    message = "Apenas #{valid_amount}/#{donation.amount} "
    message += "#{item.name} disponíveis"

    donation.amount = valid_amount

    @warnings << message
    @donations << donation.save
  end

  def update_item(item, amount)
    item.update(
      amount: item.amount - amount,
      reserved: item.reserved + amount
    )
  end
end
