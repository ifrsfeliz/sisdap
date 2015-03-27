class CreateAccountingActions < ActiveRecord::Migration
  def change
    create_table :accounting_actions do |t|
      t.string :codigo
      t.string :descricao
      t.references :exercise, index: true

      t.timestamps null: false
    end
    add_foreign_key :accounting_actions, :exercises
  end
end
