ActiveAdmin.register PortfolioProject do
  permit_params :name, :detail, :place, :area, :number_of_columns,
                :client, :type, :client_id, :type_id, :cover,
                :cover_image, :photos_attributes, tag_ids: []
  belongs_to :client, finder: :find_by_slug!

  index do
    selectable_column
    id_column
    column :name
    column :place
    column :created_at
    column :updated_at
    actions
  end

  filter :type
  filter :name
  filter :detail
  filter :place
  filter :area
  filter :tags
  filter :created_at
  filter :updated_at

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
        image_tag attachment_url(portfolio_project, :cover_image)
      end
      row :number_of_columns
      row :cover_image_filename
      row :cover_image_size
      row :cover_image_content_type
      row :cover do
        image_tag attachment_url(portfolio_project, :cover)
      end
      row :cover_filename
      row :cover_size
      row :cover_content_type
      row :created_at
      row :updated_at
    end
    active_admin_comments
  end
  
  form do |f|
    f.inputs do
      f.input :type
      f.input :name
      f.input :detail, as: :text, input_html: { rows: 5 }
      f.input :place
      f.input :area
      f.input :tags, as: :check_boxes, collection: Tag.all
    end
    f.inputs I18n.t("activerecord.attributes.portfolio_project.cover_image") do
      options = [["1x1 (proporção esperada 478x478)", 1],["1x2 (proporção esperada 921x478)", 2]]
      f.input :number_of_columns, :collection => options, :as => :radio 
      li do
        f.label :cover_image
        f.attachment_field :cover_image, direct: true
      end 
      if !f.object.new_record? && portfolio_project.cover_image
        li image_tag attachment_url(portfolio_project, :cover_image)
      end
    end
    f.inputs I18n.t("activerecord.attributes.portfolio_project.cover") do
      li "Faça upload de imagens com o tamanho: 1280 × 764 (px)"
      li do
        f.label :cover
        f.attachment_field :cover, direct: true
      end 
      if !f.object.new_record? && portfolio_project.cover
        li image_tag attachment_url(portfolio_project, :cover)
      end
    end
    f.actions
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
