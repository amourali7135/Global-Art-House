class OrdersController < ApplicationController
  # Copied from frame-me.
  def show
    @order = Order.find(params[:id])
    @cart = Cart.find(@order.shopping_cart_id)
    @cart_products = @cart.cart_products

    product_ids = []
    @cart_products.each do |cart_product|
      product_ids << cart_product.product_id
    end

    @products = []
    product_ids.each do |id|
      @products << Product.find(id)
      # j'obtiens un array des instances, mais pas leur nom
    end
  end

  def new
    @order = Order.new
    @shopping_cart = Cart.find(params[:shopping_cart_id])
    @order.amount = @shopping_cart.total_price
    @user = current_user

  end

  def create
    @order = Order.new(order_params)
    @order.user_id = current_user.id
    @order.cart_id = params[:cart_id]
    @shopping_cart = Shopping_cart.find(params[:cart_id])

    @order.amount = @shopping_cart.total_price
    @order.state = 'pending'

    if @order.save
      redirect_to new_order_payment_path(@order)
    else
      render "new"
    end
  end

  private

  def order_params
    params.require(:order).permit(:address_line_1, :address_zipcode, :address_city, :country, :phone_number)
    # here i only allow the update of the delivery fields
  end
end
