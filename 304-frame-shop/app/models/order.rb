class Order < ActiveRecord::Base
	belongs_to :wood, class_name: "Wood", foreign_key: "material_nbr"

  validates :material_nbr, presence: true
  validates :num_lin_inc, presence: true

end