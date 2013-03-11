class Todo < ActiveRecord::Base

	belongs_to :created_by_user, :class_name => 'User'
	belongs_to :completed_by_user, :class_name => 'User'
	belongs_to :list
	attr_accessible :completed_at, :completed_by_user, :created_by_user, :list, :summary
	validates :summary, :presence => true

end
