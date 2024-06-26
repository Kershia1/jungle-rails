class UsersController < ApplicationController

  def new
  end

  def create
    # puts user_params.inspect
    user = User.new(user_params)
    if user.save
      session[:user_id] = user.id
      redirect_to '/'
    else
      redirect_to '/signup'
    end
  end

  # private method to permit the user params
private
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

end