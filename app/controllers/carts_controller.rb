class CartsController < ApplicationController

  layout "site"

  def show
    @cart = current_cart
  end

  def create
    current_cart.cart_products.create!(params[:cart_item])
    flash[:notice] = "Product added to cart"
    session[:last_product_page] = request.env['HTTP_REFERER'] || products_url
    redirect_to session[:last_product_page]
  end

end
