class Client < ActiveRecord::Base
	has_many :users
	has_many :projects
	has_many :portfolio_projects

	validates :name, presence: true, uniqueness: { case_sensitive: false }

	# Setup accessible (or protected) attributes for your model
	attr_accessible :name
end