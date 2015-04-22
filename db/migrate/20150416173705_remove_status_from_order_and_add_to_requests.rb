class RemoveStatusFromOrderAndAddToRequests < ActiveRecord::Migration
  def change
    remove_column :orders, :status
    add_column :requests, :status, :string
  end
end
