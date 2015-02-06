class ChangeValorUnitarioToValorUnitarioCentsTableItems < ActiveRecord::Migration
  def change
    rename_column :items, :valor_unitario, :valor_unitario_cents
  end
end
