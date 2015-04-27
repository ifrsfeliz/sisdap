class AddJustificativaToRequestTable < ActiveRecord::Migration
  def change
    add_column :requests, :justificativa, :text
  end
end
