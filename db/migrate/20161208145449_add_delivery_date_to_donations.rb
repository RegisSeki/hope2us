class AddDeliveryDateToDonations < ActiveRecord::Migration[5.0]
  def change
    add_column :donations, :delivery_date, :date
  end
end
