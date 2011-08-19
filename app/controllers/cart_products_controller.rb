class CartProductsController < ApplicationController
  def create
    current_cart.cart_products.create!(params[:cart_product])
    flash[:notice] = "Product added to cart"
    session[:last_product_page] = request.env['HTTP_REFERER'] || products_url
    redirect_to session[:last_product_page]
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
