class CreateStockroomEntries < ActiveRecord::Migration
  def change
    create_table :stockroom_entries do |t|
      t.string :empenho_numero
      t.string :processo_suap_numero
      t.integer :quantidade
      t.integer :valor_unitario_cents
      t.text :justificativa

      t.timestamps null: false
    end
  end
end
