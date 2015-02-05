class Cover < ActiveRecord::Base
	belongs_to :client
	
	attachment :image
	
	validates_presence_of :obra, :description, :image, :client_id

	# Setup accessible (or protected) attributes for your model
	attr_accessible :obra, :description, :image, :image_id, 
					:client, :client_id
end
