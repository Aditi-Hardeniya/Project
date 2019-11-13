class LeaveController < ApplicationController
  def index
    @leave = current_user.leaves
  end
  def show
    @leave = Leave.find(params[:id])
  end
  def new
    @leave = Leave.new
  end
  def edit
    @leave =Leave.find(params[:id])
  end
  def create
    @leave = current_user.leaves.create(leave_params)
   
    @leave.save
    redirect_to leave_index_path
  end
  def update
    @leave = Leave.find(params[:id])
   
    if @leave.update(leave_params)
      redirect_to @leave
    else
      render 'edit'
    end
  end
  def destroy
    @leave = Leave.find(params[:id])
    @leave.destroy
 
    redirect_to leave_index_path
  end
  def approve
    @leave = Leave.find(params[:id])
    var = (current_user.t_leaves).to_i- (@leave.days).to_i
     if  var >= 0
    current_user.update(:t_leaves => (current_user.t_leaves).to_i- (@leave.days).to_i )
    @leave.update(:status => "accepted")
    flash[:notice] = "Leave Accepted Successfully"
     redirect_to admin_leaves_path
     else
      flash[:notice] = "you don't have enough leaves to apply"
      redirect_to admin_leaves_path
  end
end
  def reject
    @leave = Leave.find(params[:id])
    @leave.update(:status => "rejected")
    flash[:notice] = "Leave Rejected Successfully"
    redirect_to admin_leaves_path
  end
  def alloted_leaves
    @leave = current_user.leaves
    current_user.update(:t_leaves => 6)
    flash[:notice] = "Leave Alloted Successfully"
    redirect_to admin_users_path
  end
  def Back_to_Home
    redirect_to home_index_path
  end
  private
  def leave_params
    params.require(:leave).permit(:user_id, :ltype, :datefrom, :dateto, :days, :reason)
  end
end
