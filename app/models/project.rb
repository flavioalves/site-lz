class Project < ActiveRecord::Base
  belongs_to :client
  has_many :user_projects
  has_many :users, through: :user_projects
  accepts_nested_attributes_for :user_projects

  validates :name, presence: true

  # Setup accessible (or protected) attributes for your model
  attr_accessible :name, :description, :user_ids
end
