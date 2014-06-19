class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :followup_count

	def followup_count
		if current_user
			@followup_count = Log.where(followup: 2,
										:followup_due_date => Date.today.last_month.beginning_of_month..Date.today,
										user_id: current_user.id).count
		end
	end
end
