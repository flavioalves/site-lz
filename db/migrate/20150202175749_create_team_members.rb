class CreateTeamMembers < ActiveRecord::Migration
	def change
		create_table :team_members do |t|
			t.string :name, :null => false
			t.string :bio, :null => false
			t.string :linkedin_url
			
			t.string :photo_id
			t.string :photo_filename
			t.integer :photo_size
			t.string :photo_content_type
			
			t.timestamps
		end
	end
end
