class AddDateToJobs < ActiveRecord::Migration
  def change
    add_column :jobs, :post_date, :date
  end
end
