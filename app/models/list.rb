class List < ActiveRecord::Base

	belongs_to :created_by_user, :class_name => 'User'
	has_many :todos, :dependent => :destroy
	has_and_belongs_to_many :users
	attr_accessible :created_by_user, :name
	validates :name, :presence => true

end
