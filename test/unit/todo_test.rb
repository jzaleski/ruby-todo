require_relative '../test_helper'

class TodoTest < ActiveSupport::TestCase
  setup do
    @list = lists(:one)
    @user = users(:one)
  end

  test 'validation and persistence' do
    attributes = {}
    todo = Todo.new(attributes)
    assert !todo.valid?

    attributes.merge!(list: @list)
    todo = Todo.new(attributes)
    assert !todo.valid?

    attributes.merge!(summary: 'Todo Summary')
    todo = Todo.new(attributes)
    assert !todo.valid?

    attributes.merge!(created_by_user: @user)
    todo = Todo.new(attributes)
    assert todo.valid? && todo.save
  end
end
