module UsersHelper

	def admin
		User.find(:id).admin
	end
end
