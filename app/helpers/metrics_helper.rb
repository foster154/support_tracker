module MetricsHelper

	# Weekday Metrics: General
	def get_case_count(date)
		Log.where("date = ?", date).count
	end

	def get_minutes_count(date)
		Log.where("date = ?", date).sum :length
	end

	def get_case_count_sum(date1, date2, date3, date4, date5)
		get_case_count(date1) + get_case_count(date2) + get_case_count(date3) + get_case_count(date4) + get_case_count(date5)
	end

	def get_minutes_count_sum(date1, date2, date3, date4, date5)
		get_minutes_count(date1) + get_minutes_count(date2) + get_minutes_count(date3) + get_minutes_count(date4) + get_minutes_count(date5)
	end


	# Weekday Metrics: By Rep
	def get_user_case_count(user, date)
		Log.where(date: date, user_id: user.id).count
	end

	def get_user_minutes_count(user, date)
		Log.where(date: date, user_id: user.id).sum :length
	end

	def get_user_case_count_sum(user, date1, date2, date3, date4, date5)
		get_user_case_count(user, date1) + get_user_case_count(user, date2) + get_user_case_count(user, date3) + get_user_case_count(user, date4) + get_user_case_count(user, date5)
	end

	def get_user_minutes_count_sum(user, date1, date2, date3, date4, date5)
		get_user_minutes_count(user, date1) + get_user_minutes_count(user, date2) + get_user_minutes_count(user, date3) + get_user_minutes_count(user, date4) + get_user_minutes_count(user, date5)
	end

	# Sunday Metrics

	def time_range_case_count(date, time1, time2)
		Log.where(date: date, time: (time1)..(time2)).count
	end

	def time_range_case_count_sum(time1, time2)
		Log.where(date: @sunday1, time: (time1)..(time2)).count + Log.where(date: @sunday2, time: (time1)..(time2)).count + Log.where(date: @sunday3, time: (time1)..(time2)).count + Log.where(date: @sunday4, time: (time1)..(time2)).count
	end

	def time_range_case_count_average(time1, time2)
		(Log.where(date: @sunday1, time: (time1)..(time2)).count + Log.where(date: @sunday2, time: (time1)..(time2)).count + Log.where(date: @sunday3, time: (time1)..(time2)).count + Log.where(date: @sunday4, time: (time1)..(time2)).count)/4.0
	end

	def get_sunday_case_count_sum_5
		get_case_count(@sunday1) + get_case_count(@sunday2) + get_case_count(@sunday3) + get_case_count(@sunday4) + get_case_count(@sunday5)
	end

	def get_sunday_case_count_sum_4
		get_case_count(@sunday1) + get_case_count(@sunday2) + get_case_count(@sunday3) + get_case_count(@sunday4)
	end

	def get_sunday_minutes_count_sum_5
		get_minutes_count(@sunday1) + get_minutes_count(@sunday2) + get_minutes_count(@sunday3) + get_minutes_count(@sunday4) + get_minutes_count(@sunday5)
	end

	def get_sunday_minutes_count_sum_4
		get_minutes_count(@sunday1) + get_minutes_count(@sunday2) + get_minutes_count(@sunday3) + get_minutes_count(@sunday4)
	end

	def get_missed_case_count(date)
		Log.where("date = ?", date).where("case_type = ?", "4").count
	end

	def get_missed_case_count_sum_5
		get_missed_case_count(@sunday1) + get_missed_case_count(@sunday2) + get_missed_case_count(@sunday3) + get_missed_case_count(@sunday4) + get_missed_case_count(@sunday5)
	end

	def get_missed_case_count_sum_4
		get_missed_case_count(@sunday1) + get_missed_case_count(@sunday2) + get_missed_case_count(@sunday3) + get_missed_case_count(@sunday4)
	end

end