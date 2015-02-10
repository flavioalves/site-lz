ActiveAdmin.register ProjectFile do
  permit_params :name, :description, :project_file, 
                :project_id, :client_id
  belongs_to :project, finder: :find_by_slug!

  breadcrumb do
    my_breadcrumb = []
    
    my_url = "/admin" 
    my_breadcrumb << link_to('admin', my_url)
    
    my_url << "/clients"
    my_breadcrumb << link_to('Cliente(s)', my_url)
    
    my_client = project.client
    my_url << "/#{my_client.slug}"
    my_breadcrumb << link_to(my_client.name, my_url)
    
    my_url << "/projects"
    my_breadcrumb << link_to('Projeto(s)', my_url)
    
    my_url << "/#{project.slug}"
    my_breadcrumb << link_to(project.name, my_url)
    
    if params[:action] != 'index'
      my_url = "/admin/projects/#{project.slug}/project_files"
      my_breadcrumb << link_to('Arquivo(s)', my_url)
      if params[:action] == 'edit'
        my_url << "/#{project_file.id}"
        my_breadcrumb << link_to(project_file.name, my_url)
      end
    end
    my_breadcrumb
  end

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
      f.input :description, as: :text, input_html: { rows: 5 }
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
