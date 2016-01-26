class AddAssociationBetweeenStockroomItemAndEntry < ActiveRecord::Migration
  def change
    add_column :stockroom_entries, :stockroom_item_id, :integer
    add_index :stockroom_entries, :stockroom_item_id
  end
end
