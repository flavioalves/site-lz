class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
  		 :recoverable, :rememberable, :trackable, :validatable

  belongs_to :client
  has_many :user_projects
  has_many :projects, through: :user_projects
  accepts_nested_attributes_for :user_projects

  validates :name, presence: true

  # Setup accessible (or protected) attributes for your model
  attr_accessible :name, :email, :password, :password_confirmation, :remember_me,
  				  :project_ids           
end