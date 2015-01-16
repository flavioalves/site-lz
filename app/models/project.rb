class Project < ActiveRecord::Base
  belongs_to :client

  validates :name, presence: true

  # Setup accessible (or protected) attributes for your model
  attr_accessible :name
end
