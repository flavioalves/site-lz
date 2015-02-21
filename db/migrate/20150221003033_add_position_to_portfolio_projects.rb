class AddPositionToPortfolioProjects < ActiveRecord::Migration
	def change
		add_column :portfolio_projects, :position, :integer
	end
end
