ActiveAdmin.register Client do
  permit_params :name

  filter :users
  filter :projects
  filter :name
  filter :created_at

  sidebar "Usuários", only: [:show, :edit] do
    ul do
      li link_to("Usuários", admin_client_users_path(client))
      li link_to("Projetos", admin_client_projects_path(client))
    end
  end

end
