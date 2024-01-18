class AddFieldsToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :course, :string
    add_column :users, :direction, :string
    add_column :users, :role, :string
    add_column :users, :nickname, :string, null: false, default: ""
    add_index :users, :nickname, unique: true
  end
end
