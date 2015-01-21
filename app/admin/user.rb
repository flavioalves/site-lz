ActiveAdmin.register User do
  permit_params :name, :email, :password, :password_confirmation,
                project_ids: []

  belongs_to :client

  index do
    selectable_column
    id_column
    column :name
    column :email
    column :current_sign_in_at
    column :sign_in_count
    column :created_at
    actions
  end

  filter :name
  filter :email
  filter :current_sign_in_at
  filter :sign_in_count
  filter :created_at

  form do |f|
    f.inputs do
      f.input :name
      f.input :email
      f.input :password
      f.input :password_confirmation
      f.input :projects, as: :check_boxes, collection: Project.where(client_id: params[:client_id])
    end
    f.actions
  end
end