class AddEmailAndPasswordIndexToUsers < ActiveRecord::Migration

	def up
		remove_index :users, :email
		change_column :users, :password, :string, :null => false
		add_index :users, [:email, :password], :name => 'email_and_password'
	end


	def down
		remove_index :users, :name => 'email_and_password'
		change_column :users, :password, :string, :null => true
		add_index :users, :email, :unique => true
	end

end
