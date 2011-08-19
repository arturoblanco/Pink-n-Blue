class CartsController < ApplicationController

  layout "site"

  def show
    @cart = current_cart
  end

end
