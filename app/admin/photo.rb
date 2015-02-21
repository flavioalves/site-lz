ActiveAdmin.register Photo do
	permit_params :image, :portfolio_project_id, :client_id, :number_of_columns
	belongs_to :portfolio_project, finder: :find_by_slug!
  
  	# fixing a third level breadcrumb: customizing a new one.
	breadcrumb do
		my_breadcrumb = []
		
		my_url = "/admin" 
		my_breadcrumb << link_to('admin', my_url)
		
		my_url << "/clients"
		my_breadcrumb << link_to('Cliente(s)', my_url)
		
		my_client = portfolio_project.client
		my_url << "/#{my_client.slug}"
		my_breadcrumb << link_to(my_client.name, my_url)
		
		my_url << "/portfolio_projects"
		my_breadcrumb << link_to('Projeto(s) do Portifólio', my_url)
		
		my_url << "/#{portfolio_project.slug}"
		my_breadcrumb << link_to(portfolio_project.name, my_url)
		
		if params[:action] != 'index'
			my_url = "/admin/portfolio_projects/#{portfolio_project.slug}/photos"
			my_breadcrumb << link_to('Foto(s)', my_url)
			if params[:action] == 'edit'
				my_url << "/#{photo.id}"
				my_breadcrumb << link_to("Foto ##{photo.id}", my_url)
			end
		end
		my_breadcrumb
  	end

	index as: :grid, default: true, columns: 2 do |photo|
	  div for: photo do
	  	resource_selection_cell photo
	  	if photo.number_of_columns == 1
	  		photo_image = image_tag(attachment_url(photo, :image, :fill, 239, 239))
	  	else
	  		photo_image = image_tag(attachment_url(photo, :image, :fill, 478, 239))
	  	end	
	    span link_to photo_image, admin_portfolio_project_photo_path(photo.portfolio_project, photo)
	  end
	end

	filter :image_filename
	filter :image_size
	filter :created_at
	filter :updated_at

	show do
	    attributes_table do
			row :image do
				image_tag attachment_url(photo, :image)
			end
			row :created_at
			row :updated_at
			row :number_of_columns
			row :image_filename
			row :image_size
			row :image_content_type
	    end
	    active_admin_comments
	end

  	form do |f|
    	f.inputs do
    		options = [["1x1 (proporção esperada 478x478)", 1],["1x2 (proporção esperada 921x478)", 2]]
	        f.input :number_of_columns, :collection => options, :as => :radio 

		    unless f.object.new_record?
	    		li image_tag attachment_url(photo, :image)
	    	end	
	    	li do
	    		f.label :image
	  			f.attachment_field :image, direct: true
	  		end	
		end
		f.actions
	end 	
end