class RemoveDeliveryDateToDonations < ActiveRecord::Migration[5.0]
  def change
    remove_column :donations, :delivery_date, :date
  end
end
