class AddDateOfDeliveryToDonations < ActiveRecord::Migration[5.0]
  def change
    add_column :donations, :date_of_delivery, :date
  end
end
