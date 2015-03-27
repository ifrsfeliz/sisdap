class CreateActionPlans < ActiveRecord::Migration
  def change
    create_table :action_plans do |t|
      t.references :exercise, index: true
      t.string :nome

      t.timestamps null: false
    end
    add_foreign_key :action_plans, :exercises
  end
end
