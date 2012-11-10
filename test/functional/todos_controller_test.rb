require 'test_helper'

class TodosControllerTest < ActionController::TestCase

	include Devise::TestHelpers


	setup do
		@user = sign_in users(:one)
		@todo = todos(:one)
	end


	test 'should get index' do
		get :index
		assert_response :success
		assert_not_nil assigns(:todos)
	end


	test 'create' do
		raise 'CREATE'
	end


	test 'update' do
		raise 'UPDATE'
	end


	test 'destroy' do
		raise 'DESTROY'
	end

end
