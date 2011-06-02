class CreatePresentations < ActiveRecord::Migration
  def change
    create_table :presentations do |t|
      t.string :name
      t.timestamps
    end

    add_index :presentations, :name, :unique => true
  end
end
