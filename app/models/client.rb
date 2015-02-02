class Client < ActiveRecord::Base
	include FriendlyId
	friendly_id :name, use: [:slugged]

	attachment :brand

	has_many :users
	has_many :projects
	has_many :portfolio_projects

	validates :name, presence: true, uniqueness: { case_sensitive: false }
	validates_presence_of :slug, :brand
	
	# Setup accessible (or protected) attributes for your model
	attr_accessible :name, :brand, :brand_id

	def should_generate_new_friendly_id?
		name_changed? || super
	end
end
