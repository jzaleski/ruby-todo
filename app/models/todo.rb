class Todo < ActiveRecord::Base
	belongs_to :created_by_user, :class_name => 'User'
	belongs_to :list
	attr_accessible :created_by_user, :list, :summary, :description, :completed_at
	validates :summary, :presence => true
end
