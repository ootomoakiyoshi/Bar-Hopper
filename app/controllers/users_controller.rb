class UsersController < ApplicationController

  def index
   @users = User.all
   @book = Bar.new
   @user = current_user
  end

  def show
   @user = User.find(params[:id])
   @bars = @user.bars.page(params[:page]).reverse_order
  end

  def edit
   @user = User.find(params[:id])
  end

  def update
   @user = User.find(params[:id])
   if @user.update(user_params)
    redirect_to user_path(@user.id), notice: "You have updated User successfully."
   else
    render "edit"
   end
  end

  private

  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end
end
