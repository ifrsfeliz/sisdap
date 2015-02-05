class CreateSupplierGroups < ActiveRecord::Migration
  def change
    create_table :supplier_groups do |t|
      t.string :nome

      t.timestamps null: false
    end
  end
end
