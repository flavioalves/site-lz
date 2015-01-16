ActiveAdmin.register Client do
  sidebar 'Mais Informações', only: [:show, :edit] do
    ul do
      li link_to(I18n.t("activerecord.models.user"), admin_client_users_path(client))
      li link_to(I18n.t("activerecord.models.project"), admin_client_projects_path(client))
    end
  end
end