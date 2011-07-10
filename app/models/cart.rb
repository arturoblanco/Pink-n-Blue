class Cart < ActiveRecord::Base
  # ASOCIATIONS
  has_many :cart_products
  has_many :products, :through => :cart_products
  
  # METHODS
  def total_products
    self.cart_products.count
  end
  
  def total_shopp
    100.25
  end
end
