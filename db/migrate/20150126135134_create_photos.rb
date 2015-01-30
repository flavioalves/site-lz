class CreatePhotos < ActiveRecord::Migration
	def change
		create_table :photos do |t|
			t.string :image_id
			t.references :portfolio_project, index: true
			t.timestamps
		end
	end
end
