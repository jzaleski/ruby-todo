class Todo < ActiveRecord::Base

	belongs_to :completed_by_user, :class_name => 'User'
	belongs_to :created_by_user, :class_name => 'User'
	belongs_to :list

	validates :summary, :presence => true

	attr_accessible(
    :completed_at,
    :completed_by_user,
    :created_by_user,
    :list,
    :summary
  )

  scope :completed, lambda { where('completed_at IS NOT NULL') }
  scope :not_completed, lambda { where('completed_at IS NULL') }
  scope :with_list_id, lambda { |list_id| where(:list_id => list_id) }

end
