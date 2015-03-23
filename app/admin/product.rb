ActiveAdmin.register Product do


  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  permit_params :list, :of, :attributes, :on, :model, :category_id, :name, :description, :description_long, :price, :stock_quantity, :image
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
      f.input :category_id
      f.input :name
      f.input :description
      f.input :description_long
      f.input :price
      f.input :stock_quantity
      f.input :image, required: false
    end
    f.actions
  end

end
