class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @uesr.save
      session[:user_id] = @user.id.to_s
      redirect_to user_path(current_user)
    else
      render :new
    end
  end

  def update # this action is responsible for saving an update to a specific user
    @user = User.find(params[:id])
    if @user.update_attributes(params.require(:user).permit(:user_name, :name, :email, :image))
      redirect_to users_path
    else #if unsuccessful, show to the edit page  
    render "edit"
   end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to users_path
  end

  private
  def user_params
    params.require(:user).permit(:name, :user_name, :email, :password, :password_confirmation)
  end
end
