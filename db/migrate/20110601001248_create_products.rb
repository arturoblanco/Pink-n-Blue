class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.text :description
      t.float :price_for_sale
      t.float :price_for_buy
      t.float :discount
      t.string :color
      t.timestamps
    end

    add_index :products, :id, :unique => true
    add_index :products, :name, :unique => true
  end
end
