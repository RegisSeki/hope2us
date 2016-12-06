class Item < ApplicationRecord
  has_many :donations
  has_many :user, through: :donations
end
