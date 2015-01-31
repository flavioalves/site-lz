class AddCoverImageToPortfolioProjects < ActiveRecord::Migration
  def change
    add_column :portfolio_projects, :cover_image_id, :string
    add_column :portfolio_projects, :cover_image_filename, :string
    add_column :portfolio_projects, :cover_image_size, :integer
    add_column :portfolio_projects, :cover_image_content_type, :string
  end
end
