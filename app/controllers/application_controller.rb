class ApplicationController < ActionController::Base
  helper :all

  protect_from_forgery

  helper_method :current_cart

  def current_cart
    @current_cart ||= Cart.first || Cart.create!
    session[:cart_id] = @current_cart.id
    @current_cart
  end

end
