class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
     	t.integer :material_nbr
     	t.integer :num_lin_inc
      	t.boolean :inc_hang_hware
      	t.float   :total_price
    end
  end
end
