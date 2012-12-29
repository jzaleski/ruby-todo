class DropDeviseColumnsFromUsers < ActiveRecord::Migration

	COLUMNS = [
		[:reset_password_token, :string],
		[:reset_password_sent_at, :datetime],
		[:remember_created_at, :datetime],
		[:sign_in_count, :integer, {:default => 0}],
		[:current_sign_in_at, :datetime],
		[:last_sign_in_at, :datetime],
		[:current_sign_in_ip, :string],
		[:last_sign_in_ip, :string],
	]


	def up
		remove_index :users, :name => 'index_users_on_reset_password_token'
		COLUMNS.each do |column|
			remove_column :users, column[0]
		end
	end


	def down
		COLUMNS.each do |column|
			add_column :users, column[0], column[1], column[2] || {}
		end
		add_index :users, ['reset_password_token'], :name => 'index_users_on_reset_password_token', :unique => true
	end

end
