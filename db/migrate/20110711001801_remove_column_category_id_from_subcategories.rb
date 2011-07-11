class RemoveColumnCategoryIdFromSubcategories < ActiveRecord::Migration
  def up
    remove_column :subcategories, :category_id
  end

  def down
    add_column :subcategories, :category_id, :integer
  end
end