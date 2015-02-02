class AddBrandToClients < ActiveRecord::Migration
	def change
		add_column :clients, :brand_id, :string
		add_column :clients, :brand_filename, :string
		add_column :clients, :brand_size, :integer
		add_column :clients, :brand_content_type, :string
	end
end
