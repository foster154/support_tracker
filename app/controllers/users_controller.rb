class UsersController < ApplicationController
	def index
	end

	def show
		@logs_with_followup = Log.where(user_id: current_user.id, followup: 2).order('followup_due_date ASC')
	end
end
