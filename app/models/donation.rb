class Donation < ApplicationRecord
  belongs_to :user
  belongs_to :item

  mount_uploader :image, DonationUploader
end
