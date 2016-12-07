class Donation < ApplicationRecord
  belongs_to :user
  belongs_to :item

  validates :user, :item, presence: true
  validate :limit_amount

  def limit_amount
    errors.add(
      :item, "Todos os(as) #{item.name} foram doados"
    ) if item.amount.zero?
  end
end
