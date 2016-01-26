class ChangeColumnNamesInStockroomItems < ActiveRecord::Migration
  def change
    rename_column :stockroom_entries, :empenho_numero, :numero_empenho
    rename_column :stockroom_entries, :processo_suap_numero, :numero_processo
  end
end
