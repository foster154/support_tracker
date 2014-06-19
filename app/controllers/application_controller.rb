class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :followup_count

	def followup_count
		if current_user
			needs_immediate_followup = Log.where(followup: 2,
										:followup_due_date => Date.today.last_month.beginning_of_month..Date.today,
										user_id: current_user.id).count
			followup_date_not_set = Log.where(followup: 2,
											  user_id: current_user.id,
											  followup_due_date: nil).count
			@followup_count = needs_immediate_followup + followup_date_not_set
		end
	end
end
