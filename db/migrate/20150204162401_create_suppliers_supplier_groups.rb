class CreateSuppliersSupplierGroups < ActiveRecord::Migration
  def change
    create_table :supplier_groups_suppliers do |t|
      t.references :supplier_group
      t.references :supplier
    end
  end
end
