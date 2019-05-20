class Todo < ActiveRecord::Base
  belongs_to :completed_by_user, :class_name => 'User', :optional => true
  belongs_to :created_by_user, :class_name => 'User'
  belongs_to :list

  validates :summary, :presence => true

  scope :completed, lambda { where('completed_at IS NOT NULL') }
  scope :not_completed, lambda { where('completed_at IS NULL') }
  scope :with_list_id, lambda { |list_id| where(:list_id => list_id) }
end
