class AddAttributesToUsers < ActiveRecord::Migration
  def change
    add_column :users, :full_name, :string
    add_column :users, :cargo, :string
    add_column :users, :siape, :string
  end
end
