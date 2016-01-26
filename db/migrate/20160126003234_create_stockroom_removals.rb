class CreateStockroomRemovals < ActiveRecord::Migration
  def change
    create_table :stockroom_removals do |t|
      t.references :user, index: true

      t.timestamps null: false
    end
    add_foreign_key :stockroom_removals, :users
  end
end
