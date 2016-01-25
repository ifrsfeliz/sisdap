class RemoveValorUnitarioFromStockroomItems < ActiveRecord::Migration
  def change
    remove_column :stockroom_items, :valor_unitario_cents, :integer
  end
end
