class AddNumberOfColumnsToPortfolioProjects < ActiveRecord::Migration
  def change
  	add_column :portfolio_projects, :number_of_columns, :integer
  end
end
