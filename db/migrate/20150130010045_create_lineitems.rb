class CreateLineitems < ActiveRecord::Migration
  def change
    create_table :lineitems do |t|
      t.integer :product_id
      t.integer :sell_id
      t.integer :value
      t.integer :quantity

      t.timestamps null: false
    end
  end
end
