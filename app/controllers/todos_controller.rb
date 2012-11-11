class TodosController < ApplicationController

	before_filter :parse_request, :except => :index


	# GET /todos
	# GET /todos.json
	def index
		@todos = Todo.where(:user_id => current_user.id, :completed_at => nil) + [Todo.new]
		respond_to do |format|
			format.html # index.html.erb
			format.json { render json: @todos }
		end
	end


	# POST /todos
	# POST /todos.json
	def create
		@todo.save!
		respond_to do |format|
			format.html { redirect_to todos_path }
			format.json { render json: @todo }
		end
	end


	# PUT /todos/1
	# PUT /todos/1.json
	def update
		@todo.save!
		respond_to do |format|
			format.html { redirect_to todos_path }
			format.json { render json: @todo }
		end
	end


	# DELETE /todos/1
	# DELETE /todos/1.json
	def destroy
		@todo.destroy
		respond_to do |format|
			format.html { redirect_to todos_path }
			format.json { head :no_content }
		end
	end


	private

	def parse_request
		todo_id = params[:id]
		todo_param = params[:todo] || {}
		todo_param[:completed_at] = Time.now.utc if todo_param.delete('completed') == '1'
		@todo = Todo.find_by_id_and_user_id(todo_id, current_user.id) || Todo.new(:user => current_user)
		@todo.assign_attributes(todo_param)
	end

end
