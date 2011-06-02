class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string :name
      t.text :description
      t.timestamps
    end

    add_index :articles, :name, :unique => true
  end
end
