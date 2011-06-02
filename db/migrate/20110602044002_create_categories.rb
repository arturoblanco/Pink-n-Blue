class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.string :name

      t.timestamps
    end
     add_index :categories, :id, :unique => true
     add_index :categories, :name, :unique => true
  end
end
