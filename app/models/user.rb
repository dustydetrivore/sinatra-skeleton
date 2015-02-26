class User < ActiveRecord::Base
	has_many :backings
	has_many :projects, through: :backings
	has_many :reviews
end