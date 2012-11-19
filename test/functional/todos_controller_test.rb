require 'test_helper'

class TodosControllerTest < ActionController::TestCase

	include Devise::TestHelpers


	setup do
		@user = sign_in users(:one)
		@todo = todos(:one)
	end


	test 'index (default)' do
		get :index
		assert_response :success
		assert_not_nil assigns(:todos)
		assert_select '.lines tr', 2
	end


	test 'index (completed)' do
		@todo.update_attributes(:completed_at => Time.now.utc)
		get :index, { :view => 'completed' }
		assert_response :success
		assert_not_nil assigns(:todos)
		assert_select '.lines tr', 1
	end


	test 'create' do
		summary = @todo.summary
		assert_difference('Todo.count') do
			post :create, :todo => { :summary => summary }
		end
		assert_redirected_to todos_path
		assert_equal summary, Todo.last.summary
	end


	test 'update' do
		updated_summary = "Updated #{@todo.summary}"
		put :update, :id => @todo.id, :todo => { :summary => updated_summary }
		assert_redirected_to todos_path
		assert_equal updated_summary, Todo.last.summary
	end


	test 'destroy' do
		assert_difference('Todo.count', -1) do
			delete :destroy, :id => @todo.id
		end
		assert_redirected_to todos_path
	end

end
