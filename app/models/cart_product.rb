class CartProduct < ActiveRecord::Base
  # ASSOCIATIONS
  belongs_to :cart
  belongs_to :product

  # CALLBACKS
  before_create :default_quantity_to_one
  before_create :set_product_price
  #before_create :set_default_color
  
  def total_price
    quantity * price_for_sale
  end
  
  private

  def default_quantity_to_one
    self.quantity ||= 1
  end
  
  def set_product_price
    self.price_for_sale = product.price_for_sale
  end
  
  def set_default_color
    self.color = product.color.split(",").first
  end

end
