class AddSlugToClients < ActiveRecord::Migration
  	def change
		add_column :clients, :slug, :string, :null => false
		add_index  :clients, :slug, :unique => true
	end
end
