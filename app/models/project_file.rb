class ProjectFile < ActiveRecord::Base
	attachment :project_file
	
	belongs_to :project

	validates_presence_of :project_file, :name, :description
	
	# Setup accessible (or protected) attributes for your model
	attr_accessible :name, :description, :project_file, 
					:project_id, :project_file_id
end
