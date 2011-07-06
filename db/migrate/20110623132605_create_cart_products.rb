class CreateCartProducts < ActiveRecord::Migration
  def change
    create_table :cart_products do |t|
      t.integer :cart_id
      t.integer :product_id
      t.float :price_for_sale

      t.timestamps
    end
  end
end
