class Donation < ApplicationRecord
  belongs_to :user
  belongs_to :item

  validates :date_of_delivery,
            :image,
            presence: true, on: :update

  mount_uploader :image, DonationUploader

  validates :user, :item, presence: true
  validate :limit_amount, on: :create

  def limit_amount
    errors.add(:item, "Todos #{item.name} foram doados") if item.amount.zero?
  end
end
