class AddDateToLogs < ActiveRecord::Migration
  def change
  	add_column :logs, :date, :date
  	add_column :logs, :time, :time
  end
end
