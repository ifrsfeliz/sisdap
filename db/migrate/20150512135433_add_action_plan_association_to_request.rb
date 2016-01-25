class AddActionPlanAssociationToRequest < ActiveRecord::Migration
  def change
    add_column :requests, :action_plan_id, :integer
    add_index :requests, :action_plan_id
  end
end
