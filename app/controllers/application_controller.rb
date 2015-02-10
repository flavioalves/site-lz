class ApplicationController < ActionController::Base
	protect_from_forgery

	rescue_from CanCan::AccessDenied do |exception|
    	render_not_found
  	end
	
	protected

	def render_not_found
		render file: "public/404.html", status: 404, layout: false      
	end

	def after_sign_in_path_for(resource)
		stored_location_for(resource) ||
			if resource.is_a?(User)
				clients_path(:name => current_user.client.slug)
			else
				super
			end
	end
end