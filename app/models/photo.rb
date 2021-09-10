class Photo < ActiveRecord::Base
	default_scope { order('created_at ASC') }
	has_attached_file :image

	belongs_to :portfolio_project

	validates :image, presence: true
	validates :number_of_columns, presence: true

	# Setup accessible (or protected) attributes for your model
	attr_accessible :image, :portfolio_project_id, :image_id, :number_of_columns
end
