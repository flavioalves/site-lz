class ApplicationController < ActionController::Base
	protect_from_forgery

	protected

	def render_not_found
		render file: "public/404.html", status: 404, layout: false      
	end

	def after_sign_in_path_for(resource_or_scope)
		clients_path(:name => current_user.name)
	end
end
