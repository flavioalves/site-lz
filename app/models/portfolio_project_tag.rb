class PortfolioProjectTag < ActiveRecord::Base
	belongs_to :tag
	belongs_to :portfolio_project

	# Setup accessible (or protected) attributes for your model
	attr_accessible :tag_id, :portfolio_project_id
end
