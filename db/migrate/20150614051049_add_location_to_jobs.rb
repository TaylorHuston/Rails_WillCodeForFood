class AddLocationToJobs < ActiveRecord::Migration
  def change
    add_column :jobs, :location, :string, :limit => 50
  end
end
