class AddUserRefToDonations < ActiveRecord::Migration[5.0]
  def change
    add_reference :donations, :user, foreign_key: true
  end
end
