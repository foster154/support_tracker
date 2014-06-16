class Tag < ActiveRecord::Base
	has_many :categorizations
	has_many :logs, through: :categorizations
end
