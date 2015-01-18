ActiveAdmin.register Project do
  permit_params :name
  belongs_to :client

  filter :name
  filter :created_at

  form do |f|
    f.inputs do
      f.input :name
    end
    f.actions
  end
end
