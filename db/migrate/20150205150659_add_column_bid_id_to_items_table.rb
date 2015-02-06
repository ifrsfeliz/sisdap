class AddColumnBidIdToItemsTable < ActiveRecord::Migration
  def change
    add_column :items, :bid_id, :integer
    add_index :items, :bid_id
  end
end
