require 'test_helper'

class TodosControllerTest < ActionController::TestCase

	setup do
		@todo = todos(:one)
		@session = {:user_id => users(:one).id, :list_id => lists(:one).id}
	end


	test 'index (unauthorized)' do
		get :index
		assert_redirected_to :controller => :authentication, :action => :login
	end


	test 'index (default)' do
		get :index, nil, @session
		assert_response :success
		assert_not_nil assigns(:todos)
		assert_select '.lines tr', 2
	end


	test 'index (completed)' do
		get :index, {:view => 'completed'}, @session
		assert_response :success
		assert_not_nil assigns(:todos)
		assert_select '.lines tr', 1
	end


	test 'create' do
		created_by_user_id = @todo.created_by_user_id
		list_id = @todo.list_id
		summary = @todo.summary
		assert_difference('Todo.count') do
			post :create, {:todo => {:summary => summary}}, @session
		end
		assert_redirected_to todos_path
		assert_equal created_by_user_id, Todo.last.created_by_user_id
		assert_equal list_id, Todo.last.list_id
		assert_equal summary, Todo.last.summary
	end


	test 'update' do
		updated_summary = "Updated #{@todo.summary}"
		put :update, {:id => @todo.id, :todo => {:summary => updated_summary}}, @session
		assert_redirected_to todos_path
		assert_equal updated_summary, Todo.find(@todo.id).summary
	end

end
