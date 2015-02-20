class AddCoverToPortfolioProjects < ActiveRecord::Migration
	def change
		add_column :portfolio_projects, :cover_id, :string
		add_column :portfolio_projects, :cover_filename, :string
		add_column :portfolio_projects, :cover_size, :integer
		add_column :portfolio_projects, :cover_content_type, :string
	end
end
