class CreateProjectFiles < ActiveRecord::Migration
	def change
		create_table :project_files do |t|
			t.string :name
			t.string :description
			t.references :project, index: true

			t.string :project_file_id
			t.string :project_file_filename
			t.integer :project_file_size
			t.string :project_file_content_type
			
			t.timestamps
		end
	end
end
