class AddColumnReferencesToRequestsTable < ActiveRecord::Migration
  def change
    add_column :requests, :numero_do_empenho, :string
    add_column :requests, :classificacao_do_empenho, :string
    add_column :requests, :fonte_do_empenho, :string
    add_column :requests, :data_empenho, :date
    add_column :requests, :accounting_action_id, :integer
    add_column :requests, :order_id, :integer
    add_column :requests, :item_id, :integer
  end
end
