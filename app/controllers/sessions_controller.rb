class SessionsController < ApplicationController
  def new
  end

  def create
     @user = User.find_by(email: params[:email])
     if @user && @user.authenticate(params[:password])
       session[:user_id] = @user.id
       flash[:success] = "okok"
       redirect_to users_path
     else
        flash.now[:error] = "#{@user.errors.messages}"
        render :new
     end
  end

  def destroy
    @current_user = nil
    session[:user_id] =  nil
    flash[:success] = "Bye bye"
    redirect_to root_path
  end
end
