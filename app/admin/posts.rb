ActiveAdmin.register Post do
  permit_params :title, :content, :image_url, :user_id
end
