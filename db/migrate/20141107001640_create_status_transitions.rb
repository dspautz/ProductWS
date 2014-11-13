class CreateStatusTransitions < ActiveRecord::Migration
  def change
    create_table :status_transitions do |t|
      t.string :event, null: false
      t.string :from, null: false
      t.string :to, null: false
      t.belongs_to :order, null: false
      t.timestamps
    end
  end
end
