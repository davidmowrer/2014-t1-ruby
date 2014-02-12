class CreateUfoSightings < ActiveRecord::Migration
  def change
    create_table :ufo_sightings do |t|
    	t.string :date
    	t.string :city
    	t.string :state
    end
  end
end
