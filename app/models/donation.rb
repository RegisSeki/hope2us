class Donation < ApplicationRecord
  belongs_to :user
  belongs_to :item

  validates :date_of_delivery,
            :image,
            presence: true, on: :update

  mount_uploader :image, DonationUploader
end
