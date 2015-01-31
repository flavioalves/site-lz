class PortfolioProject < ActiveRecord::Base
	extend FriendlyId
	friendly_id :name, use: [:slugged]

  attachment :cover_image

	scope :client, -> (client_id) { where client_id: client_id }
	scope :type, -> (type_id) { where type_id: type_id }
  # scope :tag, -> (tag_id) { where(tag_id: tag_id) }

	belongs_to :type
	belongs_to :client

	validates_presence_of :type, :name, :detail, :place, :area, :slug

	has_many :photos, :dependent => :destroy
	accepts_nested_attributes_for :photos, :allow_destroy => true

	has_many :portfolio_project_tags
	has_many :tags, through: :portfolio_project_tags
	accepts_nested_attributes_for :portfolio_project_tags

	# Setup accessible (or protected) attributes for your model
	attr_accessible :name, :detail, :place, :area, 
                	:type, :type_id, :client, :client_id, 
                	:photos_attributes, :photos, :tag_ids,
                  :cover_image, :cover_image_id  
end
