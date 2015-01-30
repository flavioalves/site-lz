class Tag < ActiveRecord::Base
	validates :name, presence: true, uniqueness: { case_sensitive: false }
	validates :class_name, presence: true

	# Setup accessible (or protected) attributes for your model
	attr_accessible :name, :class_name, :portfolio_project_ids
end
