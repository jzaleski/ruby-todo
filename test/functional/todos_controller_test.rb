require 'test_helper'

class TodosControllerTest < ActionController::TestCase

	setup do
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
		list_id = @todo.list_id
		summary = @todo.summary
		assert_difference('Todo.count') do
			post :create, :current_list => {:id => list_id}, :todo => {:summary => summary}
		end
		assert_redirected_to todos_path
		assert_equal list_id, Todo.last.list_id
		assert_equal summary, Todo.last.summary
	end


	test 'update' do
		updated_summary = "Updated #{@todo.summary}"
		put :update, :id => @todo.id, :todo => {:summary => updated_summary}
		assert_redirected_to todos_path
		assert_equal updated_summary, Todo.last.summary
	end

end
