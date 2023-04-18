class User < ActiveRecord::Base
  has_and_belongs_to_many :lists, -> { order('created_at') }

  validates :email, :format => { :with => /\A.+@.+\..+\Z/ }
  validates :email, :uniqueness => true
  validates :password, :length => { :in => 6..25 }

  def can_see?(list)
    lists.include?(list)
  end
end
