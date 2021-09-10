class TeamMember < ActiveRecord::Base
  	attachment :photo

	acts_as_list

	default_scope { order(:position) }


	validates :name, presence: true
	validates :bio, presence: true, length: { maximum: 255 }
	validates :linkedin_url, presence: true, format: { with: URI.regexp }
    validates :photo, presence: true
	
	attr_accessible :name, :bio, :linkedin_url, :photo_id,
					:photo
end
