class Cover < ActiveRecord::Base
	belongs_to :client
	
	attachment :image
	
	validates_presence_of :obra, :image, :client
	validates :description, presence: true, length: { maximum: 255 }
	
	# Setup accessible (or protected) attributes for your model
	attr_accessible :obra, :description, :image, :image_id, 
					:client, :client_id
end
