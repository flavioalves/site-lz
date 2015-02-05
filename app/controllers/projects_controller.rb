class ProjectsController < ApplicationController
	before_action :authenticate_user!
	authorize_resource

	layout "pages"

	def show
		@projects = current_user.projects.includes(:project_files)
		
		@selected_project = Project.friendly.find(params[:name])
		@client = @selected_project.client

		authorize! :read, @selected_project
		render 'clients/show'
	end
end
