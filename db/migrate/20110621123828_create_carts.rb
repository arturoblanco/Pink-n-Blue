class CreateCarts < ActiveRecord::Migration
  def change
    create_table :carts do |t|
      t.datetime :checkout_date

      t.timestamps
    end
  end
end
