class TodosController < ApplicationController

	before_filter :parse_request, :except => :index


	# GET /todos
	# GET /todos.json
	def index
		if @view_completed = params[:view] == 'completed'
			@todos = Todo.where('list_id = ? and completed_at is not null', list.id).order(:created_at)
		else
			@todos = Todo.where('list_id = ? and completed_at is null', list.id).order(:created_at) + [Todo.new(:created_by_user => user, :list => list)]
		end
		respond_to do |format|
			format.html
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


	private

	def parse_request
		todo_param = params[:todo] || {}
		todo_id = params[:id]
		@todo = todo_id.present? ? Todo.find(todo_id) : Todo.new
		@todo.created_by_user ||= user
		@todo.list ||= list
		todo_param[:completed_at] = Time.now.utc if todo_param.delete('completed') == '1'
		@todo.assign_attributes(todo_param)
	end

end
