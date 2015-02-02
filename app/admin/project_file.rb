ActiveAdmin.register ProjectFile do
  permit_params :name, :description, :project_file, 
                :project_id, :client_id
  belongs_to :project, finder: :find_by_slug!

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
  filter :image_filename
  filter :image_size
  filter :created_at
  filter :updated_at

  show do
    attributes_table do
      row :name
      row :description
      row :project_file do
        link_to project_file.project_file_filename, attachment_url(project_file, :project_file),
                target: '_blank'
      end
      row :project_file_filename
      row :project_file_size
      row :project_file_content_type
      row :created_at
      row :updated_at
    end
    active_admin_comments
  end

  form do |f|
    f.inputs do
      f.input :name
      f.input :description, as: :text
      unless f.object.new_record?
        li link_to project_file.project_file_filename, attachment_url(project_file, :project_file)
      end 
      li do
        f.label :project_file
        f.attachment_field :project_file, direct: true
      end 
    end
    f.actions
  end
end
