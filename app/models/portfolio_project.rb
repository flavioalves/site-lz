class PortfolioProject < ActiveRecord::Base
	extend FriendlyId
	friendly_id :name, use: [:slugged]

  	attachment :cover_image

	scope :client, -> (client_id) { where client_id: client_id }
	scope :type, -> (type_id) { where type_id: type_id }
  	scope :tag, -> (tag_id) { joins(:portfolio_project_tags).where('portfolio_project_tags.tag_id = ?', tag_id)}
	
	belongs_to :type
	belongs_to :client
	has_many :photos, :dependent => :destroy
	has_many :portfolio_project_tags
	has_many :tags, through: :portfolio_project_tags
	
	accepts_nested_attributes_for :photos, :allow_destroy => true
	accepts_nested_attributes_for :portfolio_project_tags

	validates_presence_of :type, :name, :place, :area, :slug, :cover_image
	validates :detail, presence: true, length: { maximum: 255 }
						  

	# Setup accessible (or protected) attributes for your model
	attr_accessible :name, :detail, :place, :area, 
                	:type, :type_id, :client, :client_id, 
                	:photos_attributes, :photos, :tag_ids,
                    :cover_image, :cover_image_id

    def should_generate_new_friendly_id?
    	name_changed? || super
  	end               
end