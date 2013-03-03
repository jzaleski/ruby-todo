require 'test_helper'

class ListTest < ActiveSupport::TestCase

	test 'validation and persistence' do
		attributes = {}
		list = List.new(attributes)
		assert !list.valid?

		attributes.merge!(:name => 'List Name')
		list = List.new(attributes)
		assert list.valid? && list.save
	end

end
