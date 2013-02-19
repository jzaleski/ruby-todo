class AddListsAndFixUsersToTodosRelationship < ActiveRecord::Migration

	def up
		# create the list table
		create_table :lists do |t|
			t.integer :created_by_user_id
			t.string :name, :null => false
			t.timestamps
		end

		# create the users -> lists cross-reference table (table names in the join table need to be alphabetical)
		create_table :lists_users, :id => false do |t|
			t.column :list_id, :integer
			t.column :user_id, :integer
		end

		# create a list for all existing users
		User.all.each do |user|
			list = List.create(:name => "#{user.email}'s list", :created_by_user => user)
			list.users << user
			list.save!
		end

		# add the list_id column to the todos table (we can add an index in another migration if it becomes necessary)
		add_column :todos, :list_id, :integer

		# assign the list_id to the list belonging to the todo's associated user
		# XXX: this works because a new list was just created for each user and it is safe to assume there is only one
		Todo.all.each do |todo|
			todo.list = User.find(todo.user_id).lists.first
			todo.save!
		end

		# rename the user_id column
		rename_column :todos, :user_id, :created_by_user_id
	end

	def down
		# rename the user_id column
		rename_column :todos, :created_by_user_id, :user_id

		# drop the list_id column
		remove_column :todos, :list_id

		# drop the users -> lists cross-reference table
		drop_table :lists_users
		drop_table :lists
	end

end
