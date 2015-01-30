ActiveAdmin.register Photo do
	permit_params :image, :portfolio_project_id, :client_id
	belongs_to :portfolio_project, finder: :find_by_slug!
  
  	form do |f|
    	f.inputs do
		    unless f.object.new_record?
	    		li image_tag attachment_url(photo, :image, :fill, 375, 375)
	    	end	
	  		f.attachment_field :image
		end
		f.actions
	end

	index as: :grid, default: true, columns: 2 do |photo|
	  div for: photo do
	  	resource_selection_cell photo
	    span link_to image_tag(attachment_url(photo, :image, :fill, 375, 375)),
	    	admin_portfolio_project_photo_path(photo.portfolio_project, photo)
	  end
	end

	show do
	    attributes_table do
			row :image do
				image_tag attachment_url(photo, :image, :fill, 375, 375)
			end
			row :created_at
			row :updated_at
	    end
	    active_admin_comments
	end 	
end