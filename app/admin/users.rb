ActiveAdmin.register User do
  action_item :Back_to_Home, only: :index do
    link_to "Back to Home", home_index_path, :method => :get
 end
    index do
        selectable_column
        column :id
        column :email
        column :created_at
        column :updated_at
        #  column :t_leave 
        actions do |user|
          item "Allot Leaves", alloted_path(user), :method => :post
        end
     end
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

end
