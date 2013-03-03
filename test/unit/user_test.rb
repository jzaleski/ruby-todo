require 'test_helper'

class UserTest < ActiveSupport::TestCase

	test 'validation and persistence' do
		attributes = {}
		user = User.new(attributes)
		assert !user.valid?

		attributes.merge!(:email => 'foo')
		user = User.new(attributes)
		assert !user.valid?

		attributes[:email] = 'foo@bar.com'
		user = User.new(attributes)
		assert !user.valid?

		attributes.merge!(:password => 'pass')
		user = User.new(attributes)
		assert !user.valid?

		attributes[:password] = 'password'
		user = User.new(attributes)
		assert user.valid? && user.save
	end

end
