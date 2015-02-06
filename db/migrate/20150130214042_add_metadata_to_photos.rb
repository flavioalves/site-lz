class AddMetadataToPhotos < ActiveRecord::Migration
	def change
		add_column :photos, :image_filename, :string
		add_column :photos, :image_size, :integer
		add_column :photos, :image_content_type, :string
	end
end