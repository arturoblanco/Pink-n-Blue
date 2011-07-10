class ApplicationController < ActionController::Base
  helper :all

  protect_from_forgery

  helper_method :current_cart

  def current_cart
    @current_cart ||= Cart.first || Cart.create!
  end

end
