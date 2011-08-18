class Cart < ActiveRecord::Base
  # ASOCIATIONS
  has_many :cart_products
  has_many :products, :through => :cart_products

  # METHODS
  def total_products
    self.cart_products.count
  end

  def total_shopp
    "%.2f" % cart_products.to_a.sum(&:total_price).to_f
  end
end
