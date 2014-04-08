class User < ActiveRecord::Base

	has_and_belongs_to_many :lists

	validates :email, :format => { :with => /\A.+@.+\..+\Z/ }
	validates :email, :uniqueness => true
	validates :password, :length => { :in => 6..20 }

	attr_accessible :email, :password

  def self.find_by_email_and_password(email, password)
    where('LOWER(email) = LOWER(?) AND password = ?',
      email,
      encrypt_password(password)
    ).first
  end

	def can_see?(list)
		lists.include?(list)
	end

  private

  def self.encrypt_password(password)
    Digest::SHA1.hexdigest(password)
  end

end
