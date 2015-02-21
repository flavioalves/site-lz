class PortfolioProjectsController < ApplicationController
	layout "pages"

	def index
		@portfolio_projects = PortfolioProject.where(nil)
		@portfolio_projects = @portfolio_projects.tag(params[:tag]) if params[:tag].present?
		@portfolio_projects = @portfolio_projects.client(params[:client]) if params[:client].present?
		@portfolio_projects = @portfolio_projects.type(params[:type]) if params[:type].present?
		
		respond_to do |format|
			format.html
			format.js { render layout: false }
		end
	end

	def show
		@portfolio_project = PortfolioProject.friendly.find(params[:name])
	end
end
