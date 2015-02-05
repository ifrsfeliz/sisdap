class CreateBids < ActiveRecord::Migration
  def change
    create_table :bids do |t|
      t.references :uasg, index: true
      t.integer :numero
      t.string :objeto_do_pregao

      t.timestamps null: false
    end
    add_foreign_key :bids, :uasgs
  end
end
