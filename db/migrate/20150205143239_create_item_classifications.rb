class CreateItemClassifications < ActiveRecord::Migration
  def change
    create_table :item_classifications do |t|
      t.string :nome

      t.timestamps null: false
    end
  end
end
