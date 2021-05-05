class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user

  def update
    msg = ""
    if params[:user].include? "email"
      msg = "Successfully updated email" if @user.update_password_with_password(user_email_params)
    else
      msg = "Successfully updated user" if @user.update user_params
    end
    if @user.errors.any?
      flash[:alert] = @user.errors.full_messages.join(',')
    else
      flash[:notice] = msg
    end
    redirect_to settings_account_path
  end

  def update_password
    if @user.update_password_with_password(password_update_params)
      bypass_sign_in(@user)
    end
    if @user.errors.any?
      flash[:alert] = @user.errors.full_messages.join(',')
    else
      flash[:notice] = "Successfully updated password"
    end
    redirect_to settings_account_path
  end

  def show; end

  private

  def set_user
    @user = if params[:id]
              User.find(params[:id])
            else
              current_user
            end
  end

  def user_params
    params.require(:user).permit(:first_name, :last_name, :avatar)
  end

  def user_email_params
    params.require(:user).permit(:email, :current_password)
  end

  def password_update_params
    params.require(:user).permit(:current_password, :password, :password_confirmation)
  end
end