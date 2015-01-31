class Photo < ActiveRecord::Base
	attachment :image
	
	belongs_to :portfolio_project

	validates :image, presence: true

	# Setup accessible (or protected) attributes for your model
	attr_accessible :image, :portfolio_project_id, :image_id
end
