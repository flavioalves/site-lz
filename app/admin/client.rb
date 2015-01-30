ActiveAdmin.register Client do
	sidebar I18n.t("app.active_admin.more_information"), only: [:show, :edit] do
		ul do
			li link_to(I18n.t("activerecord.models.portfolio_project"), admin_client_portfolio_projects_path(client))
			li link_to(I18n.t("activerecord.models.project"), admin_client_projects_path(client))
			li link_to(I18n.t("activerecord.models.user"), admin_client_users_path(client))
		end
	end
end