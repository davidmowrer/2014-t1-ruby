class CreateWoods < ActiveRecord::Migration
  def change
    create_table :woods do |t|
    	t.string :name
    	t.float  :cost
    end
  end
end
