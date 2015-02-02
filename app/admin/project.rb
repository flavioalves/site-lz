ActiveAdmin.register Project do
  permit_params :name, :description, user_ids: []
  belongs_to :client, finder: :find_by_slug!

  index do
    selectable_column
    id_column
    column :name
    column :created_at
    column :updated_at
    actions
  end

  filter :name
  filter :description
  filter :created_at
  filter :updated_at

  form do |f|
    f.inputs do
      f.input :name
      f.input :description, as: :text
      users = project.client.users
      f.input :users, as: :check_boxes, collection: users unless users.blank?
    end
    f.actions
  end

  sidebar I18n.t("app.active_admin.more_information"), only: [:show, :edit] do
    ul do
      li link_to(I18n.t("activerecord.models.project_file"), admin_project_project_files_path(project))
    end
  end
  
  controller do
    def find_resource
      scoped_collection.friendly.find(params[:id])
    end
  end
end
