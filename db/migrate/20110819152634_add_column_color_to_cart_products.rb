class AddColumnColorToCartProducts < ActiveRecord::Migration
  def change
    add_column :cart_products, :color, :string
  end
end
