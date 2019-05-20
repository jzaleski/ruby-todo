require_relative '../test_helper'

class ListTest < ActiveSupport::TestCase
  setup do
    @user = users(:one)
  end

  test 'validation and persistence' do
    attributes = {}
    list = List.new(attributes)
    assert !list.valid?

    attributes.merge!(name: 'List Name')
    list = List.new(attributes)
    assert !list.valid?

    attributes.merge!(created_by_user: @user)
    list = List.new(attributes)
    assert list.valid? && list.save
  end
end
