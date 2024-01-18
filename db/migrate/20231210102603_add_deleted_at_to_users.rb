class AddDeletedAtToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :deleted_at, :timestamp
    add_index :users, :deleted_at
  end
end
