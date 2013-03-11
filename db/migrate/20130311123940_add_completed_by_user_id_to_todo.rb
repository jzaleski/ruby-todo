class AddCompletedByUserIdToTodo < ActiveRecord::Migration

	def up
		add_column :todos, :completed_by_user_id, :integer
		Todo.where('completed_at is not null').each do |todo|
			todo.completed_by_user = todo.created_by_user
			todo.save!
		end
	end


	def down
		remove_column :todos, :completed_by_user_id
	end

end
