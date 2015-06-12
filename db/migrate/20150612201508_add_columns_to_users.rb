class AddColumnsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :name, :string, :limit => 50
    add_column :users, :email, :string, :limit => 50, :null => false
    add_column :users, :hashed_password, :string
  end
end
