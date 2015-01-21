ActiveAdmin.register User do
  permit_params :name, :email, :password, :password_confirmation,
                project_ids: []

  belongs_to :client
  
  controller do
    def update
      if params[:user][:password].blank? && params[:user][:password_confirmation].blank?
        params[:user].delete("password")
        params[:user].delete("password_confirmation")
      end
      super
    end
  end

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
      if f.object.new_record?
        f.input :password 
        f.input :password_confirmation
      end 
      projects = user.client.projects
      f.input :projects, as: :check_boxes, collection: projects unless projects.blank?
    end

    unless f.object.new_record?
      f.inputs do
        li do 
          label I18n.t("helpers.label.user.change_password")
          span check_box_tag 'change_password', 'false', false
        end
        f.input :password 
        f.input :password_confirmation
      end
    end
    f.actions
  end
end