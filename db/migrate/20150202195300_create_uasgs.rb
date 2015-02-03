class CreateUasgs < ActiveRecord::Migration
  def change
    create_table :uasgs do |t|
      t.string :codigo
      t.string :nome

      t.timestamps null: false
    end
  end
end
