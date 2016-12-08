class AddImageToDonations < ActiveRecord::Migration[5.0]
  def change
    add_column :donations, :image, :string
  end
end
