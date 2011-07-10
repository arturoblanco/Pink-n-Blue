class CartProduct < ActiveRecord::Base
  # ASSOCIATIONS
  belongs_to :cart
  belongs_to :product

  # CALLBACKS
  before_create :default_quantity_to_one

  private

  def default_quantity_to_one
    self.quantity ||= 1
  end

end
