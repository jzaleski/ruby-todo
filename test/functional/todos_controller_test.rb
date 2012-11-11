require 'test_helper'

class TodosControllerTest < ActionController::TestCase

	include Devise::TestHelpers


	setup do
		@user = sign_in users(:one)
		@todo = todos(:one)
	end


	test 'index' do
		get :index
		assert_response :success
		assert_not_nil assigns(:todos)
	end


	test 'create' do
		assert_difference('Todo.count') do
			post :create, :todo => { :summary => @todo.summary }
		end
		assert_redirected_to todos_path
	end


	test 'update' do
		put :update, :id => @todo.id, :todo => { :summary => "Updated #{@todo.summary}" }
		assert_redirected_to todos_path
	end


	test 'destroy' do
		assert_difference('Todo.count', -1) do
			delete :destroy, :id => @todo.id
		end
		assert_redirected_to todos_path
	end

end
