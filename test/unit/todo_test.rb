require 'test_helper'

class TodoTest < ActiveSupport::TestCase

	test 'validation and persistence' do
		attributes = {}
		todo = Todo.new(attributes)
		assert !todo.valid?

		attributes.merge!(:summary => 'Todo Summary')
		todo = Todo.new(attributes)
		assert todo.valid? && todo.save
	end

end
