class CartProductsController < ApplicationController
  def create
    @shopping_cart = current_cart.cart_products.new(params[:cart_product])
    if @shopping_cart.save 
      @response = {:status => "success", :cart_info => current_cart.cart_info}
    else
      @response = {:status => "error", :message => "The product could not be added."}
    end
    render :json => @response
  end
  
  def destroy
    @cart_product = CartProduct.find(params[:id])
    if @cart_product.destroy
      flash[:success] = "The product was successfully removed from the shopping cart."
    else
      flash[:error] = "The product could not be deleted. Try again."
    end
    redirect_to cart_path(current_cart.id)
  end
end
