ActiveAdmin.register PortfolioProject do
  permit_params :name, :detail, :place, :area,
                :client, :type, :client_id, :type_id,
                :cover_image, :photos_attributes, tag_ids: []
  belongs_to :client

  filter :type
  filter :tags
  filter :name
  filter :detail
  filter :place
  filter :area
  filter :created_at
  filter :updated_at

  index do
    selectable_column
    id_column
    column :name
    column :detail
    column :place
    column :area
    column :created_at
    column :updated_at
    actions
  end

  form do |f|
    f.inputs do
      f.input :type
      f.input :name
      f.input :detail, as: :text
      f.input :place
      f.input :area
      f.input :tags, as: :check_boxes, collection: Tag.all
      li do
        f.label :cover_image
        f.attachment_field :cover_image, direct: true
      end 
      if !f.object.new_record? && portfolio_project.cover_image
        li image_tag attachment_url(portfolio_project, :cover_image, :fill, 375, 375)
      end 
    end
    f.actions
  end  

  show do
    attributes_table do
      row :id
      row :name
      row :detail
      row :place
      row :area
      row :client
      row :type
      row :cover_image do
        image_tag attachment_url(portfolio_project, :cover_image, :fill, 375, 375)
      end
      row :cover_image_filename
      row :cover_image_size
      row :cover_image_content_type
      row :created_at
      row :updated_at
    end
    active_admin_comments
  end 

  sidebar I18n.t("app.active_admin.more_information"), only: [:show, :edit] do
    ul do
      li link_to(I18n.t("activerecord.models.photo"), admin_portfolio_project_photos_path(portfolio_project))
    end
  end

  controller do
    def find_resource
      scoped_collection.friendly.find(params[:id])
    end
  end         
end
