class Item < ApplicationRecord
  has_many :donations
  has_many :user, through: :donations

  def available_amounts
    (1..amount).to_a.reverse
  end

  def self.available
    where.not(amount: 0)
  end
end
