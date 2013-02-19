class AddUniqueIndexToEmailOnUsers < ActiveRecord::Migration

	def up
		add_index :users, :email, :name => 'email', :unique => 'true'
	end


	def down
		remove_index :users, :name => 'email'
	end

end
