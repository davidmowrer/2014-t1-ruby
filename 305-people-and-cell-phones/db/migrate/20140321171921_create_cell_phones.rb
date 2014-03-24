class CreateCellPhones < ActiveRecord::Migration
  def change
    create_table :cell_phones do |t|
    	t.integer :serial_number 

      t.timestamps
    end
  end
end
