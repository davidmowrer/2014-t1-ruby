class CreateCarts < ActiveRecord::Migration
  def change
    create_table :carts do |t|
      t.integer :ship_method_id

      t.timestamps
    end
  end
end
