class AddDepartamentoToUsersTable < ActiveRecord::Migration
  def change
    add_column :users, :departamento, :string
  end
end
