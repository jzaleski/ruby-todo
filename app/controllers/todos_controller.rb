class TodosController < ApplicationController

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
		raise 'CREATE'
	end


	# PUT /todos/1
	# PUT /todos/1.json
	def update
		raise 'UPDATE'
	end


	# DELETE /todos/1
	# DELETE /todos/1.json
	def destroy
		raise 'DELETE'
	end

end
