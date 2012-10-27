class Todo < ActiveRecord::Base
	belongs_to :user
	attr_accessible :user, :summary, :description, :completed_at
	validates :summary, :presence => true
end
