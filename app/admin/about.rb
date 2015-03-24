ActiveAdmin.register About do


  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  permit_params :list, :of, :attributes, :on, :model, :title, :content, :image
  #
  # or
  #
  # permit_params do
  #   permitted = [:permitted, :attributes]
  #   permitted << :other if resource.something?
  #   permitted
  # end
  form multipart: true do |f|
    f.inputs "Project Details" do
      f.input :title
      f.input :content
      f.input :image, required: false
    end
    f.actions
  end


end
