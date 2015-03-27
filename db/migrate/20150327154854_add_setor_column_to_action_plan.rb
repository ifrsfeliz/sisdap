class AddSetorColumnToActionPlan < ActiveRecord::Migration
  def change
    add_column :action_plans, :setor, :string
  end
end
