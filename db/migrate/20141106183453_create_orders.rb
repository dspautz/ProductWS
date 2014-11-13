class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.date :order_date, default: Time.now
      t.integer :vat, default: 20
      t.string :status, null: false
      t.index :status
      t.timestamps
    end
  end
end
