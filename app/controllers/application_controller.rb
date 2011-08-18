class ApplicationController < ActionController::Base
  helper :all

  protect_from_forgery

  before_filter :set_shoping_cart

  helper_method :current_cart

  def current_cart
    @current_cart = @current_cart || Cart.find(cookies[:cart_id])
  end

  def set_shoping_cart
    cart = cookies[:cart_id] || Cart.create!
    cookies[:cart_id].nil? ? cookies[:cart_id] = cart.id  : cookies[:cart_id]
  end

end
