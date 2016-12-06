class AddItemRefToDonations < ActiveRecord::Migration[5.0]
  def change
    add_reference :donations, :item, foreign_key: true
  end
end
