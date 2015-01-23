class UserProject < ActiveRecord::Base
	belongs_to :user
	belongs_to :project

	# Setup accessible (or protected) attributes for your model
    attr_accessible :user_id, :project_id
end
