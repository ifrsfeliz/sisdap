class CreateStockroomRemovalItems < ActiveRecord::Migration
  def change
    create_table :stockroom_removal_items do |t|
      t.integer :stockroom_item_id
      t.integer :stockroom_removal_id
      t.integer :quantidade

      t.timestamps null: false
    end
  end
end
