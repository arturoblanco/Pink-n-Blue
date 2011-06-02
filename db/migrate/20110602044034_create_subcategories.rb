class CreateSubcategories < ActiveRecord::Migration
  def change
    create_table :subcategories do |t|
      t.string :name
      t.integer :category_id

      t.timestamps
    end
    add_index :subcategories, :id, :unique => true
    add_index :subcategories, :name, :unique => true
  end
end
