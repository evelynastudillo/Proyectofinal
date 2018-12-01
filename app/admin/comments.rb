ActiveAdmin.register Comment, as: 'PostComment' do
  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # permit_params :list, :of, :attributes, :on, :model
  controller do
    def scoped_collection
      end_of_association_chain.includes(:user)
    end
  end

  #
  # or
  #
  # permit_params do
  #   permitted = [:permitted, :attributes]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end

  index do
    column :id
    column :user_id
    column :post_id
    column :name do |comment|
      comment.user.email
    end
    column :comment
    column :created_at
    column :update_at
    actions
  end
  filter :created_at, as: :date_range

end
