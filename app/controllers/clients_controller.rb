class ClientsController < ApplicationController
	before_action :authenticate_user!
	authorize_resource

	layout "pages"

	def show
		@client = Client.friendly.find(params[:name])
		authorize! :read, @client
		
		@projects = current_user.projects.includes(:project_files)

		unless @projects.blank?
			@selected_project = current_user.projects.first
		end
	end
end
