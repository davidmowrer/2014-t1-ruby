class User < ActiveRecord::Base
	validates :first_name, presence: true
	validates :age, presence: true
end
