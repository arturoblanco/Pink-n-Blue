class CreateCategorySubcategories < ActiveRecord::Migration
  def change
    create_table :category_subcategories do |t|
      t.integer :category_id
      t.integer :subcategory_id
      t.timestamps
    end
    add_index :category_subcategories, :id, :unique => true
    add_index :category_subcategories, :category_id, :unique => false
    add_index :category_subcategories, :subcategory_id, :unique => false
  end
end
