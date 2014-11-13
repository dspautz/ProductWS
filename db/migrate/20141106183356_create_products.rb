class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name, unique: true, null:false
      t.decimal :net_price, precision:10, scale:2, null:false   # Not specific in the challenge, precision:10, scale:2
      t.timestamps
    end
  end
end
