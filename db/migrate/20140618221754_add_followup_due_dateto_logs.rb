class AddFollowupDueDatetoLogs < ActiveRecord::Migration
  def change
  	  	add_column :logs, :followup_due_date, :date
  end
end
