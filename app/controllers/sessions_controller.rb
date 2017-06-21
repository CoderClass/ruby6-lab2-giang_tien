class SessionsController < ApplicationController
  def new
  end

  def create
    if @user = User.find_by(email: params[:email])
     if @user.authenticate(params[:password])
       session[:user_id] = @user.id
       flash[:success] = "okok"
       redirect_to root_path
     else
       render :new
     end
   else
     flash[:error] = "Sign up to continue"
     redirect_to new_user_path
   end
  end

  def destroy
    @current_user = nil
    session[:user_id] =  nil
    flash[:success] = "Bye bye"
    redirect_to root_path
  end
end
