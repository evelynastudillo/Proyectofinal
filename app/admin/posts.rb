ActiveAdmin.register Post do
  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # permit_params :list, :of, :attributes, :on, :model
  #
  # or
  #
  # permit_params do
  #   permitted = [:permitted, :attributes]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  permit_params :user_id, :name, :photo, :location


  index do
    column :id
    column :user_id
    column :name do |post|
      post.user.email
    end
    column :photo #do |post|
    #  image_tag post.photo.url
    #end
    column :location
    column :comments do |post|
      post.comments.count
    end
    column :likes do |post|
      post.likes.count
    end
    column :created_at
    column :update_at
    actions
  end

  filter :created_at, as: :date_range
end
