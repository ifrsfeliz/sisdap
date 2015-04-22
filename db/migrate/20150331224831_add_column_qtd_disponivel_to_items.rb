class AddColumnQtdDisponivelToItems < ActiveRecord::Migration
  def change
    add_column :items, :qtd_disponivel, :integer
  end
end
