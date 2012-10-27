class CreateTodos < ActiveRecord::Migration
	def change
		create_table :todos do |t|
			t.integer :user_id
			t.string :summary, :null => false
			t.string :description
			t.datetime :completed_at
			t.timestamps
		end
	end
end
