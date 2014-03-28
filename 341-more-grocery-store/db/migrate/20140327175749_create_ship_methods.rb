class CreateShipMethods < ActiveRecord::Migration
  def change
    create_table :ship_methods do |t|
      t.string :name
      t.float :price_per_cart
      t.float :price_per_item

      t.timestamps
    end
  end
end
