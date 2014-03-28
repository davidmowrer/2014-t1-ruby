class Cart < ActiveRecord::Base
  belongs_to :ship_method
  has_many :cart_lines
end
