class ProjectsController < ApplicationController
	layout "pages"

	def show
		@projects = current_user.projects.includes(:project_files)
		
		@selected_project = Project.friendly.find(params[:name])
		@client = @selected_project.client
		
		render 'clients/show'
	end
end
