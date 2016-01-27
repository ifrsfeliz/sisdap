class RemoveTablesNotUsedAnymore < ActiveRecord::Migration
  def change
    drop_table :stockroom_removals
    drop_table :stockroom_entries
  end
end
