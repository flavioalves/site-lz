class Type < ActiveRecord::Base
	validates :name, presence: true 

	# Setup accessible (or protected) attributes for your model
	attr_accessible :name
end
