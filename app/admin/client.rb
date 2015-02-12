ActiveAdmin.register Client do
	permit_params :name, :brand, :url

	index do
	    selectable_column
	    id_column
	    column :name
	    column :url
	    column :created_at
	    column :updated_at
	    actions
  	end

	filter :name
	filter :url
    filter :portfolio_projects
    filter :projects
    filter :users
    filter :created_at
    filter :updated_at
	
	show do
		attributes_table do
			row :id
			row :name
			row :url
			row :brand do
				image_tag attachment_url(client, :brand) if client.brand
			end
		end
		active_admin_comments
	end

  	form do |f|
	    f.inputs do
	    	f.input :name
	    	f.input :url
	    	li do
	    			para "Faça upload de imagens com até tamanho: 250 x 250"
		        f.label :brand
		        f.attachment_field :brand, direct: true
		    end 
		    if !f.object.new_record? && client.brand
		    	li image_tag attachment_url(client, :brand)
		    end
	    end
	    f.actions
	end

	sidebar I18n.t("app.active_admin.more_information"), only: [:show, :edit] do
		ul do
			li link_to(I18n.t("activerecord.models.portfolio_project"), admin_client_portfolio_projects_path(client))
			li link_to(I18n.t("activerecord.models.project"), admin_client_projects_path(client))
			li link_to(I18n.t("activerecord.models.user"), admin_client_users_path(client))
		end
	end

	controller do
    	def find_resource
      		scoped_collection.friendly.find(params[:id])
    	end
	end
end