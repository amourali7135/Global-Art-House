class ShoppingCartsController < ApplicationController
  # copied from frame me
  def show

    @cart = Cart.find(params[:id])
    @cart_products = @cart.cart_products

    art_ids = []
    @cart_products.each do |cart_product|
      product_ids << cart_product.product_id
    end
    # là je récupère les ids de TOUS les produits contenu dans 1 caddie

    @arts = []
    prices = []
    product_ids.each do |id|
      art = Art.find(id)
      prices << art.price_cents
      @arts << art
    end

    @quantity = @arts.length
    @total_price = prices_cents.inject(0){|sum,x| sum + x }
    @cart.total_price = @total_price
    @cart.save

    @products_in_current_cart = CartProduct.where(cart_id: @cart.id)

  end
end
