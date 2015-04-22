class ChangeStatusColumnType < ActiveRecord::Migration
  def up
    change_column :requests, :status, :integer
  end

  def down
    change_column :requests, :status, :string
  end
end
