class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.string :image_filename
      t.float :price_per_item

      t.timestamps
    end
  end
end
