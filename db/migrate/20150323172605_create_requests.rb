class CreateRequests < ActiveRecord::Migration
  def change
    create_table :requests do |t|
      t.integer :qtd_solicitada

      t.timestamps null: false
    end
  end
end
