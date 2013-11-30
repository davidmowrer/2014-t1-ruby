class CreateMenuItems < ActiveRecord::Migration
  def change
    create_table :menu_items do |t|
      t.string :name
      t.float :price
      t.string :restaurant_name

      t.timestamps
    end
  end
end
