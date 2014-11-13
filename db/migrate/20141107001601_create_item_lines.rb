class CreateItemLines < ActiveRecord::Migration
  def change
    create_table :item_lines do |t|
      t.integer :quantity
      t.decimal :net_price
      t.belongs_to :product
      t.belongs_to :order

      t.timestamps
    end
  end
end
