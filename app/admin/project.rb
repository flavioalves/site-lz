ActiveAdmin.register Project do
  permit_params :name, :description, user_ids: []
  belongs_to :client

  filter :name
  filter :created_at

  form do |f|
    f.inputs do
      f.input :name
      f.input :description
      users = project.client.users
      f.input :users, as: :check_boxes, collection: users unless users.blank?
    end
    f.actions
  end
end
