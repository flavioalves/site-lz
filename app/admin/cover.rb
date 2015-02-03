ActiveAdmin.register Cover do
  permit_params :obra, :description, :image, :client, :client_id

  index do
      selectable_column
      id_column
      column :obra
      column :created_at
      column :updated_at
      actions
    end

  filter :created_at
  filter :updated_at
  
  show do
    attributes_table do
      row :id
      row :obra
      row :description
      row :image do
        image_tag attachment_url(cover, :image, :fill, 375, 375) if cover.image
      end
      row :image_filename
      row :image_size
      row :image_content_type
      row :created_at
      row :updated_at
    end
    active_admin_comments
  end

  form do |f|
    f.inputs do
      f.input :obra
      f.input :description, as: :text
      f.input :client
      li do
          f.label :image
          f.attachment_field :image, direct: true
      end 
      if !f.object.new_record? && cover.image
        li image_tag attachment_url(cover, :image, :fill, 375, 375)
      end
    end
    f.actions
  end
end