class CreateMembers < ActiveRecord::Migration
  def change
    create_table :members do |t|
    	t.string  :username
    	t.string  :password_digest
    end
  end
end
