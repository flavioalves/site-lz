class Project < ActiveRecord::Base
	include FriendlyId
  	friendly_id :name, use: [:slugged]

	belongs_to :client
	has_many :project_files
	has_many :user_projects
	has_many :users, through: :user_projects
	
	accepts_nested_attributes_for :user_projects

	validates :name, presence: true

	# Setup accessible (or protected) attributes for your model
	attr_accessible :name, :description, :user_ids

	def should_generate_new_friendly_id?
    	name_changed? || super
  	end
end
