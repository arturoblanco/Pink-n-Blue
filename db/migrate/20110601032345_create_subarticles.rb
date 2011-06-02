class CreateSubarticles < ActiveRecord::Migration
  def change
    create_table :subarticles do |t|
      t.integer :product_id
      t.integer :presentation_id
      t.integer :article_id
      t.integer :in_stock
      t.float :price_for_sale
      t.float :price_of_buy
      t.float :discount
      t.string :color

      t.timestamps
    end

    add_index :subarticles, :product_id
    add_index :subarticles, :presentation_id
    add_index :subarticles, :article_id
    add_index :subarticles, :color
  end
end
