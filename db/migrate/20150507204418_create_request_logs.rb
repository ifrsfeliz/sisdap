class CreateRequestLogs < ActiveRecord::Migration
  def change
    create_table :request_logs do |t|
      t.text :description
      t.belongs_to :request, index: true
      t.belongs_to :user, index: true

      t.timestamps null: false
    end
    add_foreign_key :request_logs, :requests
    add_foreign_key :request_logs, :users
  end
end
