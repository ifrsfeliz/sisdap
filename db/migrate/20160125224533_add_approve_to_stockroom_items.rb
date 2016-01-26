class AddApproveToStockroomItems < ActiveRecord::Migration
  def change
    add_column :stockroom_entries, :aprovada, :boolean
  end
end
