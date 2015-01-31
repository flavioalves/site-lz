class ProjectsController < ApplicationController
	layout "pages"

	def index
		@projects = PortfolioProject.where(nil)
		@projects = @projects.tag(params[:tag]) if params[:tag].present?
		@projects = @projects.client(params[:client]) if params[:client].present?
		@projects = @projects.type(params[:type]) if params[:type].present?
	end

	def show
		@project = PortfolioProject.friendly.find(params[:name])
	end
end
