class Donation < ApplicationRecord
  belongs_to :user
  belongs_to :item

  validates :user, :item, presence: true
  validate :limit_amount

  def limit_amount
  	"Todos os(as) #{item.name} foram doados" if item.amount == 0
  end
end
