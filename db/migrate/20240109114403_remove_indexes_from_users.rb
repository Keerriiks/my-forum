class RemoveIndexesFromUsers < ActiveRecord::Migration[7.1]
  def change
    remove_index :users, name: "index_users_on_email"
    remove_index :users, name: "index_users_on_nickname"
  end
end
