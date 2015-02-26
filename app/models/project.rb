class Project < ActiveRecord::Base
	has_many :backings
	has_many :users, through: :backings
	has_many :reviews
	belongs_to :creator
end