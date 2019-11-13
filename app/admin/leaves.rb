ActiveAdmin.register Leave do
  action_item :Back_to_Home, only: :index do
    link_to "Back to Home", home_index_path(leaves), :method => :get
 end
  
  index do
    selectable_column
    column :user
    column :ltype
    column :datefrom
    column :dateto
    column :days
    column :reason
    actions do |leave|
      item "approve"  , approve_path(leave.id), :method => :post
      item "  reject" , reject_path(leave.id), :method => :post
    end
  end
# form do |f|
#     # f.input        
#     f.input :ltype
#     f.input :datefrom
#     f.input  :dateto
#     f.input :days
#     f.input :reason
#     f.input :status, :as => :select, :collection => [["Approved", "Approved"], ["Rejected", "Rejected"]]
#     f.actions    
#   end
    # <%= form_for :leave, url:  admin_leaves_path  do |f| %>
    #     <p style='padding-left:60px;'>
    #       <%= f.label :Status %><br>
    #       <%= f.select :status, ['Approved', 'rejected']%>
    #     </p>
    # end
    
    #   action_item :approve, only: :index do
    #     link_to "Reject", admin_dashboard_path()
    #   end
    # index do 
    #     column :ltype
    #     column :datefrom
    #     column() {|post| link_to 'Approve', :action => :approve }
    #   end 
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
# permit_params :list, :of, :attributes, :on, :model
#
# or
#
permit_params do
  permitted = [:permitted, :ltype, :datefrom, :dateto, :days, :reason, :status]
  permitted << :other if params[:action] == 'create' && current_user.admin?
  permitted
end
controller do
def create
    @leave = Leave.new(permitted_params[:leave])
end
end
# collection_action :b_action, method: :post do
   
#     redirect_to , notice: "CSV imported successfully!"
#   end


end