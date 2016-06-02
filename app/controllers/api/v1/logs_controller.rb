class Api::V1::LogsController < Api::V1::BaseController

	def index
		@date = params[:date] || Date.today
		respond_with @logs = Log.where("date = ?", @date).order('time DESC')
	end

end
