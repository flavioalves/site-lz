class TeamMember < ActiveRecord::Base
  	attachment :photo

	validates_presence_of :name, :bio, :photo

	attr_accessible :name, :bio, :linkedin_url, :photo_id,
					:photo
end
