class AddUrlToClients < ActiveRecord::Migration
	def change
		add_column :clients, :url, :string, null: false
	end
end