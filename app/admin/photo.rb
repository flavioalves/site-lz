ActiveAdmin.register Photo do
	permit_params :image, :portfolio_project_id, :client_id, :number_of_columns
	belongs_to :portfolio_project, finder: :find_by_slug!
  
	index as: :grid, default: true, columns: 2 do |photo|
	  div for: photo do
	  	resource_selection_cell photo
	    span link_to image_tag(attachment_url(photo, :image)),
	    	admin_portfolio_project_photo_path(photo.portfolio_project, photo)
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
    		options = [["1x1", 1],["1x2", 2]]
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