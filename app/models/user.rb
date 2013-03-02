class User < ActiveRecord::Base

	has_and_belongs_to_many :lists
	attr_accessible :email, :password


	def can_see?(list)
		lists.include?(list)
	end

end
