class Cart < ActiveRecord::Base
  # ASOCIATIONS
  has_many :cart_products
  has_many :products, :trough => :cart_products
end
