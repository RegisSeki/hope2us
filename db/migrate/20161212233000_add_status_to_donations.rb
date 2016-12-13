class AddStatusToDonations < ActiveRecord::Migration[5.0]
  def change
    add_column :donations, :status, :integer, default: 0
  end
end
