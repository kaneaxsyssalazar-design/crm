ActiveAdmin.register Customer do
  permit_params :full_name, :phone_number, :email_address, :notes, :image

  filter :full_name
  filter :phone_number
  filter :email_address
  filter :created_at

  index do
    selectable_column
    id_column
    column :image do |customer|
      image_tag(url_for(customer.image), width: 48, height: 48) if customer.image.attached?
    end
    column :full_name
    column :phone_number
    column :email_address
    actions
  end

  form do |f|
    f.semantic_errors
    f.inputs "Customer" do
      f.input :full_name
      f.input :phone_number
      f.input :email_address
      f.input :notes
      f.input :image, as: :file
    end
    f.actions
  end

  show do
    attributes_table do
      row :image do |customer|
        image_tag(url_for(customer.image), width: 200) if customer.image.attached?
      end
      row :full_name
      row :phone_number
      row :email_address
      row :notes
    end
  end
end