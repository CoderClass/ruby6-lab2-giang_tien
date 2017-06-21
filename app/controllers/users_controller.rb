class UsersController < ApplicationController

  def new
    @user = User.new
  end

   # POST /users
  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "Welcom #{@user.name}"
      session[:user_id] = @user.id
    else
      flash[:error] = "Error: #{@user.errors.full_messages.to_sentence}"
    end
    redirect_to root_path
  end


  def index
    @users = User.all.shuffle
  end

  private
    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end
end
