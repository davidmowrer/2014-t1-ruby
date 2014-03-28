class MainController < ApplicationController

  def index
    @cart = Cart.find_by(id: session[:cart_id])
    if @cart == nil
      @cart = Cart.new
      @cart.ship_method_id = ShipMethod.first.id
      @cart.save!
      session[:cart_id] = @cart.id

      Product.all.each do |product|
        CartLine.create! cart_id: @cart.id, product_id: product.id, quantity: 0
      end
    end

    @products = Product.order("name")

    @ship_methods = ShipMethod.order(:id)

    render :index and return
  end

  def index_post
    # TODO: load @cart variable
    # TODO: Update quantities from params
    # TODO: Update ship_method_id

    redirect_to "/" and return
  end

end
