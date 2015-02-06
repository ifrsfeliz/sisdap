class ChangeColumnTypeInItemsTable < ActiveRecord::Migration
  def up
    change_column :items, :descricao, :text
  end

  def down
    change_column :items, :descricao, :string
  end
end
