class Log < ActiveRecord::Base
	has_many :categorizations
	has_many :tags, through: :categorizations
	belongs_to :customer
	belongs_to :user
end
