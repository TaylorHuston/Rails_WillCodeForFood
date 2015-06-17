class AddIndexToJobsForUsers < ActiveRecord::Migration
  def change
    add_index :jobs, :user_id
  end
end
