class CreateItems < ActiveRecord::Migration[5.0]
  def change
    create_table :items do |t|
      t.string :name
      t.text :description
      t.integer :amount, default: 0
      t.integer :reserved, default: 0
      t.integer :confirmed, default: 0

      t.timestamps
    end
  end
end
