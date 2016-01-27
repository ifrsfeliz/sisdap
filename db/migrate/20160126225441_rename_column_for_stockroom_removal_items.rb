class RenameColumnForStockroomRemovalItems < ActiveRecord::Migration
  def change
    rename_column :stockroom_removal_items, :stockroom_removal_id, :stockroom_movimentation_id
  end
end
