class UserController < ApplicationController
  before_action :set_user, only: [:update]
  def search
    email = params[:email]
    @user = User.first(email:email)
  end

  def update
     password = params[:password]
    repeat_password = params[:repeat_password]
    role = params[:role]
        if !password.blank? && !repeat_password.blank? && password != repeat_password
      redirect_to find_user_path(email:@user.email), :alert => 'passwords must match'
      return
    end
    @user.role = role
    @user.save!
    respond_to do |format|
      if @user.set(user_params)
        format.html { redirect_to find_user_path(email:@user.email), :notice => 'User updated'}
      else
        format.html { redirect_to find_user_path(email:@user.email), :notice => 'Error'}
      end
    end

      end
  
  private
    def set_user
      @user = User.find(params["user"]["id"])
    end
  # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:first_name, :last_name, :inactive)
    end
end
