class Api::V1::LogsController < Api::V1::BaseController

	def index
		@date = params[:date] || Date.today
		respond_with @logs = Log.where("date = ?", @date).order('time DESC')
	end

	def create
		respond_with :api, :v1, Log.create(log_params)
	end

	def destroy
		respond_with Log.destroy(params[:id])
	end

	def update
		log = Log.find(params["id"])
		log.update_attributes(log_params)
		respond_with log, json: log
	end

	private

	def log_params
		params.require(:log).permit(:id, :person, :description, :date)
	end



end
