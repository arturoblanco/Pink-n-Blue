class CartsController < ApplicationController

  layout "site"

  def show
    @cart = current_cart
  end
  
  def destroy
    @cart = current_cart.cart_products
    if @cart.destroy_all
      flash[:success] = "The shopping cart was succesfully cleared."
    else
      flash[:error] = "The shopping cart could not be cleared. Try again later"
    end
    redirect_to products_path
  end

end
