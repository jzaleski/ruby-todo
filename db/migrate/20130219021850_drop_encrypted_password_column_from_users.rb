class DropEncryptedPasswordColumnFromUsers < ActiveRecord::Migration

	def up
		remove_column :users, :encrypted_password
	end


	def down
		# XXX: in the down migration we can't [re-]add the "NOT NULL" contraint
		add_column :users, :encrypted_password, :string
	end

end
