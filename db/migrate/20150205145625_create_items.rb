class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.integer :item
      t.references :item_classification, index: true
      t.string :descricao
      t.references :supplier, index: true
      t.date :validade
      t.string :unidade
      t.integer :quantidade
      t.integer :valor_unitario
      t.string :tipo
      t.text :observacao
      t.boolean :ativo

      t.timestamps null: false
    end
    add_foreign_key :items, :item_classifications
    add_foreign_key :items, :suppliers
  end
end
