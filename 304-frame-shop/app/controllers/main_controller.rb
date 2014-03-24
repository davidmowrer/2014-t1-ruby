class MainController < ApplicationController
	def index
    @new_order = Order.new
    render :index and return
  end

  def place_order
    @new_order = Order.new
    @new_order.material_nbr   = params["material_nbr"]
    @new_order.num_lin_inc    = params["num_lin_inc"]
    @new_order.inc_hang_hware = params["inc_hang_hware"]

    if @new_order.material_nbr != nil
      price = @new_order.wood.cost
    else
      price = 0.00 
    end

    if @new_order.num_lin_inc != nil
      price = price + @new_order.num_lin_inc * 1.00
    end

    if @new_order.inc_hang_hware == true
      price = price + 0.50
    end

    @new_order.total_price = price

    if @new_order.save == true
      flash[:info] = "Thank you for your order."
      redirect_to "/" and return
    else
      render :index and return
    end
  end

end
