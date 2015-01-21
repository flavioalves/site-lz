ActiveAdmin.register Project do
  permit_params :name, user_ids: []
  belongs_to :client

  filter :name
  filter :created_at

  form do |f|
    f.inputs do
      f.input :name
      f.input :users, as: :check_boxes, collection: User.where(client_id: params[:client_id])
    end
    f.actions
  end
end
