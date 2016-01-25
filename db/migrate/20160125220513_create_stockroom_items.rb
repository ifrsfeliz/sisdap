class CreateStockroomItems < ActiveRecord::Migration
  def change
    create_table :stockroom_items do |t|
      t.text :descricao
      t.integer :quantidade, default: 0
      t.integer :valor_unitario_cents

      t.timestamps null: false
    end
  end
end
