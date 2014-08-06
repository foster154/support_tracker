class MetricsController < ApplicationController

	def weekdays
		@date = params[:date] || Date.today

		@monday = @date.to_date.beginning_of_week
		@tuesday = @monday.advance(days: 1)
		@wednesday = @tuesday.advance(days: 1)
		@thursday = @wednesday.advance(days: 1)
		@friday = @thursday.advance(days: 1)

		@users = User.where("role = ?", "Support")
	end

	def sundays
		@date = params[:date] || Date.today

		@sunday1 = @date.to_date.end_of_week
		@sunday2 = @sunday1.advance(days: -7)
		@sunday3 = @sunday2.advance(days: -7)
		@sunday4 = @sunday3.advance(days: -7)

		@sundays = [@sunday4, @sunday3, @sunday2, @sunday1]
	end

	def monthly
	end

end