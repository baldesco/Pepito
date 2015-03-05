class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :ref
      t.integer :price
      t.integer :quantity, default: 0
      t.string :brand
      t.text :description
      t.string :size
      t.string :color

      t.timestamps null: false
    end
  end
end
