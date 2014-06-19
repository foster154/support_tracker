class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :followup_count

	def followup_count
		if current_user
			@followup_count = Log.where(user_id: current_user.id, followup: 2).count
		end
	end
end
