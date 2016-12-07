class Donation < ApplicationRecord
  belongs_to :user
  belongs_to :item

  validates :user, :item, presence: true
  validate :limit_amount, on: :create

  def limit_amount
    errors.add(
      :item, "Todos #{item.name} foram doados"
    ) if item.amount.zero?
  end
end
