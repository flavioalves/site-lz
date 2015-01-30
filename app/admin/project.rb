ActiveAdmin.register Project do
  permit_params :name, user_ids: []
  belongs_to :client

  filter :name
  filter :created_at
  filter :updated_at

  form do |f|
    f.inputs do
      f.input :name
      users = project.client.users
      f.input :users, as: :check_boxes, collection: users unless users.blank?
    end
    f.actions
  end
end
