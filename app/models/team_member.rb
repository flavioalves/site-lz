class TeamMember < ActiveRecord::Base
  	attachment :photo

	validates :name, presence: true
	validates :bio, presence: true, length: { maximum: 255 }
	validates :linkedin_url, presence: true, format: { with: URI.regexp }
    validates :photo, presence: true
	
	attr_accessible :name, :bio, :linkedin_url, :photo_id,
					:photo
end
