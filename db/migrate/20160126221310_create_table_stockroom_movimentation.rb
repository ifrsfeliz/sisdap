class CreateTableStockroomMovimentation < ActiveRecord::Migration
  def change
    create_table :stockroom_movimentations do |t|
      t.string :numero_empenho
      t.string :numero_processo
      t.integer :quantidade
      t.integer :valor_unitario_cents
      t.text :justificativa
      t.boolean :aprovada
      t.datetime :aprovada_em
      t.references :stockroom_item, index: true

      t.integer :tipo_movimentacao #campos acima são entrada ou campos abaixo são saída | tipo ENUM

      t.references :user, index: true
      t.timestamps null: false
    end
  end
end
