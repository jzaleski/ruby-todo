class User < ActiveRecord::Base

	has_and_belongs_to_many :lists
	attr_accessible :email, :password
	validates :email, :uniqueness => true
	validates :email, :format => {:with => /\A.+@.+\..+\Z/}
	validates :password, :length => {:in => 6..20}


	def can_see?(list)
		lists.include?(list)
	end

end
