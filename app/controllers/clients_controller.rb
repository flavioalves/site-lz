class ClientsController < ApplicationController
  before_action :authenticate_user!
  layout "pages"

  def show
  	@client = Client.friendly.find(params[:name])
  	@projects = current_user.projects.includes(:project_files)

  	unless @projects.blank?
  		@selected_project = current_user.projects.first
   	end
  end
end
