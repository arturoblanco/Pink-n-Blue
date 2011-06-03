class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.integer :product_id
      t.integer :subcategory_id

      t.timestamps
    end
  end
end
