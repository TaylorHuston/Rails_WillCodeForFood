class ChangePasswordTypeOfAdmin < ActiveRecord::Migration
  def change
    remove_column "admins", "hashed_password"
    add_column "admins", "password_digest", :string
  end
end
