class RemoveDescriptionColumn < ActiveRecord::Migration

	def up
		remove_column :todos, :description
	end


	def down
		add_column :todos, :description, :string
	end

end
