class TodosController < ApplicationController

	# GET /todos
	# GET /todos.json
	def index
		@todos = Todo.where(:user_id => current_user.id, :completed_at => nil)
		respond_to do |format|
			format.html # index.html.erb
			format.json { render json: @todos }
		end
	end


	# {GET,POST,PUT} /todos/edit_in_place(.json)
	def edit_in_place
		if request.post? || request.put?
			todo_attributes = params[:todo]
			todo_attributes[:completed_at] = DateTime.now.utc if todo_attributes.delete('completed') == '1'
			Todo.find_or_initialize_by_id_and_user_id(todo_attributes[:id], current_user.id).update_attributes(todo_attributes)
		end
		@todos = Todo.where(:user_id => current_user.id, :completed_at => nil) + [Todo.new]
		respond_to do |format|
			format.html # index.html.erb
			format.json { render json: @todos }
		end
	end


	# GET /todos/1
	# GET /todos/1.json
	def show
		@todo = Todo.find_by_id_and_user_id(params[:id], current_user.id)
		respond_to do |format|
			format.html # show.html.erb
			format.json { render json: @todo }
		end
	end


	# GET /todos/new
	# GET /todos/new.json
	def new
		@todo = Todo.new
		respond_to do |format|
			format.html # new.html.erb
			format.json { render json: @todo }
		end
	end


	# GET /todos/1/edit
	def edit
		@todo = Todo.find_by_id_and_user_id(params[:id], current_user.id)
	end


	# POST /todos
	# POST /todos.json
	def create
		@todo = Todo.new(params[:todo].merge(:user => current_user))
		respond_to do |format|
			if @todo.save
				format.html { redirect_to @todo, notice: 'Todo was successfully created.' }
				format.json { render json: @todo, status: :created, location: @todo }
			else
				format.html { render action: 'new' }
				format.json { render json: @todo.errors, status: :unprocessable_entity }
			end
		end
	end


	# PUT /todos/1
	# PUT /todos/1.json
	def update
		@todo = Todo.find_by_id_and_user_id(params[:id], current_user.id)
		respond_to do |format|
			if @todo.update_attributes(params[:todo])
				format.html { redirect_to @todo, notice: 'Todo was successfully updated.' }
				format.json { head :no_content }
			else
				format.html { render action: 'edit' }
				format.json { render json: @todo.errors, status: :unprocessable_entity }
			end
		end
	end


	# DELETE /todos/1
	# DELETE /todos/1.json
	def destroy
		@todo = Todo.find_by_id_and_user_id(params[:id], current_user.id)
		@todo.destroy
		respond_to do |format|
			format.html { redirect_to todos_url }
			format.json { head :no_content }
		end
	end


	# POST /todos/1/mark_completed
	# POST /todos/1.json/mark_completed
	def mark_completed
		@todo = Todo.find_by_id_and_user_id(params[:id], current_user.id)
		respond_to do |format|
			if @todo.update_attributes(:completed_at => DateTime.now.utc)
				format.html { redirect_to todos_url }
				format.json { head :no_content }
			else
				format.html { redirect_to todos_url }
				format.json { render json: @todo.errors, status: :unprocessable_entity }
			end
		end
	end

end
