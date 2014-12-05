class UsersController < ApplicationController
  wrap_parameters format: :json

  def new
    @user = User.new
  end

  def create
    @user = User.new(new_user_params)
    if @user.save
      redirect_to categories_path, notice: "Signed Up!"
    else
      render "new"
    end
  end

  private

  def new_user_params
    params.require(:user).permit(:email, :password, :password_confirmation)  # TODOJ: Add other attributes in sign up form
  end
end
