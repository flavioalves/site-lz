ActiveAdmin.register TeamMember do
  permit_params :name, :bio, :linkedin_url, :photo,
                :photo_id

  index do
    selectable_column
    id_column
    column :name
    column :created_at
    column :updated_at
    actions
  end   

  filter :name
  filter :bio
  filter :linkedin_url
  filter :created_at
  filter :updated_at
  
  show do
    attributes_table do
      row :id
      row :name
      row :bio
      row :linkedin_url
      row :photo do
        image_tag attachment_url(team_member, :photo)
      end
      row :created_at
      row :updated_at
    end
    active_admin_comments
  end

  form do |f|
    f.inputs do
      f.input :name
      f.input :bio, as: :text, input_html: { rows: 5 }
      f.input :linkedin_url
      li do
        para "Faça upload de imagens com o tamanho: 300 x 300"
        f.label :photo
        f.attachment_field :photo, direct: true
      end 
      if !f.object.new_record? && team_member.photo
        li image_tag attachment_url(team_member, :photo)
      end 
    end
    f.actions
  end 
end
