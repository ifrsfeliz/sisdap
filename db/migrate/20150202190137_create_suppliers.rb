class CreateSuppliers < ActiveRecord::Migration
  def change
    create_table :suppliers do |t|
      t.string :cnpj
      t.string :razao_social
      t.string :email
      t.string :telefone
      t.string :celular
      t.string :contato
      t.text :observacoes

      t.timestamps null: false
    end
  end
end
