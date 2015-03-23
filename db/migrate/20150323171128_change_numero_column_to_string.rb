class ChangeNumeroColumnToString < ActiveRecord::Migration

  def up
    change_column :bids, :numero, :string
  end

  def down
    change_column :bids, :numero, :integer
  end
end
