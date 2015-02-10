class AddNumberOfColumnsToPhotos < ActiveRecord::Migration
	def change
		add_column :photos, :number_of_columns, :integer
	end
end