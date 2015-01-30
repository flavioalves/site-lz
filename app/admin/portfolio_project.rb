ActiveAdmin.register PortfolioProject do
  permit_params :name, :detail, :place, :area,
                :client, :type, :client_id, :type_id,
                :photos_attributes, tag_ids: []
  belongs_to :client

  filter :type
  filter :tags
  filter :name
  filter :detail
  filter :local
  filter :area
  filter :created_at
  filter :updated_at

  form do |f|
    f.inputs do
      f.input :type
      f.input :name
      f.input :detail
      f.input :place
      f.input :area
      f.input :tags, as: :check_boxes, collection: Tag.all
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
