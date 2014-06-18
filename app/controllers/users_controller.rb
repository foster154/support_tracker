class UsersController < ApplicationController
	def index
	end

	def show
		@logs_with_followup = Log.where(user_id: current_user.id, followup: 2).order('date DESC')
	end
end
