class CreateSells < ActiveRecord::Migration
  def change
    create_table :sells do |t|
      t.integer :total
      t.text :command
      

      t.timestamps null: false
    end
  end
end
