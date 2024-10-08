class SessionsController < ApplicationController

  def destroy
    session[:user_id] = nil
    redirect_to main_path, notice: "Logged out successfully"
  end

  def new 
  end

  def create
    @user = User.find_by({email: params[:email]})

    if @user.present? && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to main_path, notice: "Logged in successfully"
    else  
      flash[:alert] = "Invalid credentials"
      redirect_to signin_path
    end
  end
end
