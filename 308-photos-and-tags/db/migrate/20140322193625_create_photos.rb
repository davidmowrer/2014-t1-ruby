class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.string :pic_name

      t.timestamps
    end
  end
end
