class CreateCovers < ActiveRecord::Migration
	def change
		create_table :covers do |t|
			t.string :obra, null: false
			t.string :description, null: false
			t.references :client, index: true

			t.string :image_id
			t.string :image_filename
			t.integer :image_size
			t.string :image_content_type
			
			t.timestamps
		end
	end
end
