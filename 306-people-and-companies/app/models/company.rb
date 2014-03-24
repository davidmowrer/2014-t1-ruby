class Company < ActiveRecord::Base
	has_many :employees, class_name: "Employee", foreign_key: "co_id"
end
