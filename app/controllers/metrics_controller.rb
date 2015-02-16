class MetricsController < ApplicationController

	before_action :set_date

	def weekdays
		@monday = @date.to_date.beginning_of_week
		@tuesday = @monday.advance(days: 1)
		@wednesday = @tuesday.advance(days: 1)
		@thursday = @wednesday.advance(days: 1)
		@friday = @thursday.advance(days: 1)

		@users = User.where("role = ?", "Support")
	end

	def sundays

		@sunday1 = @date.to_date.beginning_of_month.advance(days: 7).beginning_of_week(:sunday)
		@sunday2 = @sunday1.advance(days: 7)
		@sunday3 = @sunday2.advance(days: 7)
		@sunday4 = @sunday3.advance(days: 7)
		@sunday5 = @sunday4.advance(days: 7)

		if @sunday5.to_date.strftime("%b") == @sunday1.to_date.strftime("%b")
			@number_of_sundays = 5
			@sundays = [ @sunday1, @sunday2, @sunday3, @sunday4, @sunday5 ]
		else
			@number_of_sundays = 4
			@sundays = [ @sunday1, @sunday2, @sunday3, @sunday4 ]
		end
	end

	def monthly

		# current week
		@week1day1 = @date.to_date.beginning_of_month.beginning_of_week(:sunday)
		@week2day1 = @week1day1.advance(days: 7)
		@week3day1 = @week1day1.advance(days: 14)
		@week4day1 = @week1day1.advance(days: 21)
		@week5day1 = @week1day1.advance(days: 28)
		@week6day1 = @week1day1.advance(days: 35)

		@week1 = [ 	@week1day1, 
					@week1day1.advance(days: 1), 
					@week1day1.advance(days: 2), 
					@week1day1.advance(days: 3), 
					@week1day1.advance(days: 4), 
					@week1day1.advance(days: 5), 
					@week1day1.advance(days: 6) ]

		@week2 = [ 	@week2day1, 
					@week2day1.advance(days: 1), 
					@week2day1.advance(days: 2), 
					@week2day1.advance(days: 3), 
					@week2day1.advance(days: 4), 
					@week2day1.advance(days: 5), 
					@week2day1.advance(days: 6) ]

		@week3 = [ 	@week3day1, 
					@week3day1.advance(days: 1), 
					@week3day1.advance(days: 2), 
					@week3day1.advance(days: 3), 
					@week3day1.advance(days: 4), 
					@week3day1.advance(days: 5), 
					@week3day1.advance(days: 6) ]

		@week4 = [ 	@week4day1, 
					@week4day1.advance(days: 1), 
					@week4day1.advance(days: 2), 
					@week4day1.advance(days: 3), 
					@week4day1.advance(days: 4), 
					@week4day1.advance(days: 5), 
					@week4day1.advance(days: 6) ]

		@week5 = [ 	@week5day1, 
					@week5day1.advance(days: 1), 
					@week5day1.advance(days: 2), 
					@week5day1.advance(days: 3), 
					@week5day1.advance(days: 4), 
					@week5day1.advance(days: 5), 
					@week5day1.advance(days: 6) ]

		@week6 = [ 	@week6day1, 
					@week6day1.advance(days: 1), 
					@week6day1.advance(days: 2), 
					@week6day1.advance(days: 3), 
					@week6day1.advance(days: 4), 
					@week6day1.advance(days: 5), 
					@week6day1.advance(days: 6) ]
	end

	def tags
		@tags = Tag.all.order(:name)
		@month_current = @date.to_date
		@month_prev1 = @date.to_date.advance(months: -1)
		@month_prev2 = @date.to_date.advance(months: -2)
		@month_prev3 = @date.to_date.advance(months: -3)
	end

	private

	def set_date
		@date = params[:date] || Date.today
	end

end